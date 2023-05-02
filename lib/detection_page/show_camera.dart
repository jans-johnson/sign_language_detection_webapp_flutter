import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'send_button.dart';

class ShowCamera extends StatefulWidget {
  const ShowCamera({super.key});

  @override
  State<ShowCamera> createState() => _ShowCameraState();
}

class _ShowCameraState extends State<ShowCamera> {
  List<CameraDescription>? cameras;
  CameraController? controller;

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
    return Column(
      children: [
        DropdownButton(
            value: controller?.description,
            hint: const Text("Select Camera"),
            items: cameras != null
                ? cameras!.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(e.name,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 75, 75, 75),
                          )),
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
            height: 350,
            width: 600,
            child: controller == null
                ? const Center(child: Text("Loading Camera..."))
                : !controller!.value.isInitialized
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : CameraPreview(controller!)),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        SendButton(controller: controller),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
      ],
    );
  }
}
