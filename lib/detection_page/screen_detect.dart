import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:sign_language_detection_webapp_flutter/detection_page/send_button.dart';
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
            SendButton(controller: controller),
          ],
        ),
      ),
    );
  }
}
