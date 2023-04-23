import 'dart:convert';
import 'dart:html';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:sign_language_detection_webapp_flutter/widgets/DisplayCaptured.dart';

class ScreenDetect extends StatefulWidget {
  const ScreenDetect({super.key});

  @override
  State<ScreenDetect> createState() => _ScreenDetectState();
}

class _ScreenDetectState extends State<ScreenDetect> {
  List<CameraDescription>? cameras;
  CameraController? controller;
  XFile? image;

  @override
  void initState() {
    loadCamera();
    super.initState();
  }

  Future<void> loadCamera() async {
    await availableCameras().then((value) {
      setState(() {
        cameras = value;
      });
    });
    if (cameras != null) {
      controller = CameraController(cameras![0], ResolutionPreset.max);
      controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    void sendPicture(XFile picture) async {
    final bytes = await picture.readAsBytes();

    final base64Image = base64Encode(bytes);

    final request = HttpRequest();
    request.open('POST', 'http://127.0.0.1:5000/upload');
    request.setRequestHeader('Content-Type', 'application/json;charset=utf-8');

    request.onLoadEnd.listen((event) {
    if (request.status == 200) {
      print(request.response);
    } else {
      print('Failed to send image.');
    }
  });

    request.send(jsonEncode({
      'image': base64Image,
    }));

    await request.onLoadEnd.first;
  }


    Future<void> captureImage() async {
      try {
        if (controller != null) {
          if (controller!.value.isInitialized) {
            for (int i = 0; i < 30; i++) {
              await controller!.takePicture().then((value) {
                sendPicture(value);
                image = value;
              });
              await Future.delayed(const Duration(milliseconds: 20));
              setState(() {
                //update UI
              });
            }
          }
        }
      } catch (e) {
        print(e); //show error
      }
    }

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            DropdownButton(
                value: controller?.description,
                hint: Text("Select Camera"),
                items: cameras != null
                    ? cameras!.map((e) {
                        return DropdownMenuItem(
                          child: Text(e.name),
                          value: e,
                        );
                      }).toList()
                    : List.empty(),
                onChanged: (val) {
                  setState(() {
                    controller = CameraController(
                        val as CameraDescription, ResolutionPreset.max);
                  });
                  controller!.initialize().then((_) {
                    if (!mounted) {
                      return;
                    }
                    setState(() {});
                  });
                }),
            SizedBox(
                height: 300,
                width: 400,
                child: controller == null
                    ? const Center(child: Text("Loading Camera..."))
                    : !controller!.value.isInitialized
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : CameraPreview(controller!)),
            ElevatedButton.icon(
                onPressed: captureImage,
                icon: Icon(Icons.camera),
                label: Text("Capture")),
            DisplayCaptured(image: image)
          ],
        ),
      ),
    );
  }
}
