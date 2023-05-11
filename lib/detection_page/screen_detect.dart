import 'package:flutter/material.dart';
import 'package:sign_language_detection_webapp_flutter/detection_page/preview_cam.dart';
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
      body: Column(
        children: [
          const WebAppBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: const ShowCamera(),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                        child: PreviewCamera(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
