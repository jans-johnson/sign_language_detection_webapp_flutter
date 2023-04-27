import 'package:flutter/material.dart';
import 'package:sign_language_detection_webapp_flutter/theme/theme_config.dart';
import 'dart:js' as js;
import 'package:simple_icons/simple_icons.dart';

class TechnologyUsed extends StatelessWidget {
  const TechnologyUsed({super.key});

  @override
  Widget build(BuildContext context) {
    Container _buildContainer(String imageUrl, String name, String description) {
      return Container(
          width: MediaQuery.of(context).size.width * 0.2,
          padding: EdgeInsets.all(20),
          color: Colors.transparent,
          child: Column(
            children: [
              Center(
                child: Image.asset(imageUrl, height: 50, width: 50), 
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ThemeConfig.lightPrimary,
                        fontSize: MediaQuery.of(context).textScaleFactor * 15)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(description,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: ThemeConfig.lightPrimary,
                        fontSize: MediaQuery.of(context).textScaleFactor * 12)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
            ],
          ),
      );
    }

    return Column(
      children: [
        Text(
          "Technologies Used",
          style: TextStyle(
              color: ThemeConfig.lightPrimary,
              fontSize: MediaQuery.of(context).textScaleFactor * 25),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildContainer(
                'assets/flutter.png',
                'Flutter',
                'Frontend Development'),
            _buildContainer(
                'assets/mediapipe.png',
                'MediaPipe',
                'Skeletal-point Detection'),
            _buildContainer(
                'assets/python.png',
                'Python',
                'Backend Development',),
          ],
        )
      ],
    );
  }
}
