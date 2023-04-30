import 'dart:convert';
import 'dart:html';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:sign_language_detection_webapp_flutter/theme/theme_config.dart';
import 'package:sign_language_detection_webapp_flutter/widgets/appbar.dart';

import '../utils/consts.dart';

class ScreenDetect extends StatefulWidget {
  const ScreenDetect({super.key});

  @override
  State<ScreenDetect> createState() => _ScreenDetectState();
}

class _ScreenDetectState extends State<ScreenDetect> {
  List<CameraDescription>? cameras;
  CameraController? controller;
  XFile? image;
  double _current = 0.0;

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
      request.setRequestHeader(
          'Content-Type', 'application/json;charset=utf-8');

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
        _current = 0.0;
        if (controller != null) {
          if (controller!.value.isInitialized) {
            for (int i = 0; i < 30; i++) {
              await controller!.takePicture().then((value) {
                sendPicture(value);
                image = value;
                setState(() {
                  _current++;
                });
              });
              await Future.delayed(const Duration(milliseconds: 10));
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
      backgroundColor: ThemeConfig.darkPrimary,
      body: Center(
        child: Column(
          children: [
            WebAppBar(),
            DropdownButton(
                value: controller?.description,
                hint: Text("Select Camera"),
                items: cameras != null
                    ? cameras!.map((e) {
                        return DropdownMenuItem(
                          child: Text(e.name,
                              style: TextStyle(
                                color: Color.fromARGB(255, 75, 75, 75),
                              )),
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
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Text(
                Constants.instructions,
                overflow: TextOverflow.clip,
                style: TextStyle(
                    color: ThemeConfig.lightPrimary,
                    fontSize: MediaQuery.of(context).textScaleFactor * 15,
                    height: MediaQuery.of(context).textScaleFactor * 1.5,
                    wordSpacing: MediaQuery.of(context).textScaleFactor * 2),
              ),
            ),
            SizedBox(
                height: 350,
                width: 600,
                child: controller == null
                    ? const Center(child: Text("Loading Camera..."))
                    : !controller!.value.isInitialized
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : CameraPreview(controller!)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            ElevatedButton.icon(
              onPressed: captureImage,
              icon: Icon(Icons.camera),
              label: Text("Capture"),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: FAProgressBar(
                currentValue: _current,
                maxValue: 29,
                changeColorValue: 100,
                backgroundColor: Colors.white,
                progressColor: Colors.lightBlue,
                direction: Axis.horizontal,
                verticalDirection: VerticalDirection.up,
                displayText: 'Images Completed',
                formatValueFixed: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
