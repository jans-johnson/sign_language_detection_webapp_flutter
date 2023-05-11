import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:sign_language_detection_webapp_flutter/detection_page/detection_utils.dart';
import 'send_button.dart';

class ShowCamera extends StatefulWidget {
  const ShowCamera({super.key});

  @override
  State<ShowCamera> createState() => _ShowCameraState();
}

class _ShowCameraState extends State<ShowCamera> {
  

  @override
  void initState() {
    loadCamera();
    super.initState();
  }

  Future<void> loadCamera() async {
    await availableCameras().then((value) {
      setState(() {
        DetectionFunction.instance.cameras = value;
      });
    });
    if (DetectionFunction.instance.cameras != null) {
      DetectionFunction.instance.controller = CameraController(DetectionFunction.instance.cameras![0], ResolutionPreset.max);
      DetectionFunction.instance.controller!.initialize().then((_) {
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
            value: DetectionFunction.instance.controller?.description,
            hint: const Text("Select Camera"),
            items: DetectionFunction.instance.cameras != null
                ? DetectionFunction.instance.cameras!.map((e) {
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
                DetectionFunction.instance.controller = CameraController(
                    val as CameraDescription, ResolutionPreset.max);
              });
              DetectionFunction.instance.controller!.initialize().then((_) {
                if (!mounted) {
                  return;
                }
                setState(() {});
              });
            }),
        SizedBox(
            height: 400,
            width: 650,
            child: DetectionFunction.instance.controller == null
                ? const Center(child: Text("Loading Camera..."))
                : !DetectionFunction.instance.controller!.value.isInitialized
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : CameraPreview(DetectionFunction.instance.controller!)),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        SendButton(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
      ],
    );
  }
}
