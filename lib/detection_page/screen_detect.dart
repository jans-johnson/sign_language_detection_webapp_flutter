import 'package:flutter/material.dart';
import 'package:sign_language_detection_webapp_flutter/detection_page/show_camera.dart';
import 'package:sign_language_detection_webapp_flutter/theme/theme_config.dart';
import 'package:sign_language_detection_webapp_flutter/widgets/appbar.dart';

import '../utils/consts.dart';

class ScreenDetect extends StatelessWidget {
  const ScreenDetect({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConfig.darkPrimary,
      body: Center(
        child: Column(
          children: [
            const WebAppBar(),
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
            const ShowCamera(),
          ],
        ),
      ),
    );
  }
}
