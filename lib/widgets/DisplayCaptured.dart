import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class DisplayCaptured extends StatelessWidget {
  XFile? image;
  DisplayCaptured({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      //show captured image
      padding: EdgeInsets.all(30),
      child: image == null
          ? Text("No image captured")
          : Image.network(
              image!.path,
              height: 300,
            ),
    );
  }
}
