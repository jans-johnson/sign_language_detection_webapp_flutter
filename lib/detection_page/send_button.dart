import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'dart:convert';
import 'dart:html';

import 'package:sign_language_detection_webapp_flutter/detection_page/show_popup.dart';

class SendButton extends StatefulWidget {
  SendButton({super.key, required this.controller});

  CameraController? controller;

  @override
  State<SendButton> createState() => _SendButtonState();
}

class _SendButtonState extends State<SendButton> {
  double _current = 0.0;
  XFile? image;

  Future<void> captureImage() async {
    try {
      _current = 0.0;
      if (widget.controller != null) {
        if (widget.controller!.value.isInitialized) {
          for (int i = 0; i < 30; i++) {
            await widget.controller!.takePicture().then((value) {
              sendPicture(value);
              image = value;
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

  void sendPicture(XFile picture) async {
    final bytes = await picture.readAsBytes();

    final base64Image = base64Encode(bytes);

    final request = HttpRequest();
    request.open('POST', 'http://127.0.0.1:5000/upload');
    request.setRequestHeader('Content-Type', 'application/json;charset=utf-8');

    request.onLoadEnd.listen((event) {
      if (request.status == 200) {
        if (request.response.toString().contains("detected")) {
          showCustomPopup(context, request.response);
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
    return Column(
      children: [
        ElevatedButton.icon(
          onPressed: captureImage,
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
