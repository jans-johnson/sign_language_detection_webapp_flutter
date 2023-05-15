import 'dart:html';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:provider/provider.dart';
import 'package:sign_language_detection_webapp_flutter/detection_page/detection_utils.dart';
import 'dart:convert';

import 'package:sign_language_detection_webapp_flutter/detection_page/show_popup.dart';

import 'SharedState.dart';

class SendButton extends StatefulWidget {
  SendButton({super.key});

  @override
  State<SendButton> createState() => _SendButtonState();
}

class _SendButtonState extends State<SendButton> {
  double _current = 0.0;

  Future<void> captureImage(SharedState sharedState) async {
    try {
      _current = 0.0;
      if (DetectionFunction.instance.controller != null) {
        if (DetectionFunction.instance.controller!.value.isInitialized) {
          for (int i = 0; i < 30; i++) {
            await DetectionFunction.instance.controller!
                .takePicture()
                .then((value) {
              sendPicture(value, sharedState);
              setState(() {
                _current++;
              });
            });
            await Future.delayed(const Duration(milliseconds: 10));
          }
        }
      }
    } catch (e) {
      //show error
    }
  }

  void sendPicture(XFile picture, SharedState sharedState) async {
    final bytes = await picture.readAsBytes();

    final base64Image = base64Encode(bytes);

    final request = HttpRequest();
    request.open('POST', 'http://127.0.0.1:5000/upload');
    request.setRequestHeader('Content-Type', 'application/json;charset=utf-8');

    request.onLoadEnd.listen((event) {
      if (request.status == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(request.response);
        String imageBase64 = jsonResponse['image'];
        String response = jsonResponse['message'];
        sharedState.updateImage(imageBase64);
        if (response.contains("detected")) {
          showCustomPopup(context, response);
        }
      } else {
        //handle the error
      }
    });

    request.send(jsonEncode({
      'image': base64Image,
    }));

    await request.onLoadEnd.first;
  }

  @override
  Widget build(BuildContext context) {
    var sharedState = Provider.of<SharedState>(context);
    return Column(
      children: [
        ElevatedButton.icon(
          onPressed: () => captureImage(sharedState),
          icon: const Icon(Icons.camera),
          label: const Text("Capture"),
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
            displayText: ' Images Sent',
            formatValueFixed: 2,
          ),
        ),
      ],
    );
  }
}
