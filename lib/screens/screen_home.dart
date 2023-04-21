import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
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
          ],
        ),
      ),
    );
  }
}
