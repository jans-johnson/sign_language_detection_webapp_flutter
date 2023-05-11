import 'dart:io';

import 'package:cross_file_image/cross_file_image.dart';
import 'package:flutter/material.dart';

import '../theme/theme_config.dart';
import '../utils/consts.dart';
import 'detection_utils.dart';

class PreviewCamera extends StatefulWidget {
  const PreviewCamera({super.key});

  @override
  State<PreviewCamera> createState() => _PreviewCameraState();
}

class _PreviewCameraState extends State<PreviewCamera> {
  bool isChecked = false;
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    Future<void> setImage() async {
      while (isChecked == true) {
        await DetectionFunction.instance.controller!
            .takePicture()
            .then((value) {
          setState(() {
            DetectionFunction.instance.image = value;
          });
        });
        await Future.delayed(const Duration(milliseconds: 200));
      }
    }

    return Column(
      children: [
        Text(
          Constants.instructions,
          overflow: TextOverflow.clip,
          style: TextStyle(
              color: ThemeConfig.lightPrimary,
              fontSize: MediaQuery.of(context).textScaleFactor * 15,
              height: MediaQuery.of(context).textScaleFactor * 1.5,
              wordSpacing: MediaQuery.of(context).textScaleFactor * 2),
        ),
        Row(
          children: [
            Checkbox(
                value: isChecked,
                onChanged: (bool? val) {
                  setState(() {
                    isChecked = val!;
                  });
                  setImage();
                })
          ],
        ),
        SizedBox(
          height: 200,
          width: 350,
          child: Center(
            child: DetectionFunction.instance.image == null
                ? CircularProgressIndicator()
                : Image(image: XFileImage(DetectionFunction.instance.image!)),
          ),
        ),
      ],
    );
  }
}
