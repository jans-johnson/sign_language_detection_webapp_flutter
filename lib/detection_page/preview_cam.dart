import 'dart:convert';
import 'dart:html' as html;
import 'dart:io';
import 'package:cross_file_image/cross_file_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/theme_config.dart';
import '../utils/consts.dart';
import 'SharedState.dart';
import 'detection_utils.dart';

class PreviewCamera extends StatefulWidget {
  const PreviewCamera({super.key});

  @override
  State<PreviewCamera> createState() => _PreviewCameraState();
}

class _PreviewCameraState extends State<PreviewCamera> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {

    var sharedState = Provider.of<SharedState>(context);
    Future<void> setImage() async {
      while (isChecked == true) {
        await DetectionFunction.instance.controller!
            .takePicture()
            .then((value) async {
          final bytes = await value.readAsBytes();
          final base64Image = base64Encode(bytes);
          final request = html.HttpRequest();
          request.open('POST', 'http://127.0.0.1:5000/detect');
          request.setRequestHeader(
              'Content-Type', 'application/json;charset=utf-8');

          request.onLoadEnd.listen((event) {
      if (request.status == 200) {
          setState(() {
            sharedState.updateImage(request.response.toString());
          });
      } else {
        //handle the error
      }
    });
          request.send(jsonEncode({
            'image': base64Image,
          }));
        });
        await Future.delayed(const Duration(milliseconds: 100));
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
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
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
                }),
            Text(
              "   Show Mediapipe Preview",
              style: TextStyle(color: ThemeConfig.lightPrimary),
            )
          ],
        ),
        SizedBox(
          height:300,
          width: 400,
          child: Center(
            child: sharedState.image == null
                ? CircularProgressIndicator()
                : Image.memory(base64Decode(sharedState.image!)),
          ),
        ),
      ],
    );
  }
}
