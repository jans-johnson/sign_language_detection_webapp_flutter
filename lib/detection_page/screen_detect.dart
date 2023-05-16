import 'package:flutter/material.dart';
import 'package:sign_language_detection_webapp_flutter/detection_page/preview_cam.dart';
import 'package:sign_language_detection_webapp_flutter/detection_page/show_camera.dart';
import 'package:sign_language_detection_webapp_flutter/theme/theme_config.dart';
import 'package:sign_language_detection_webapp_flutter/widgets/appbar.dart';
import 'package:provider/provider.dart';
import '../utils/consts.dart';
import 'SharedState.dart';

class ScreenDetect extends StatelessWidget {
  const ScreenDetect({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SharedState(),
      child: Scaffold(
        backgroundColor: ThemeConfig.darkPrimary,
        body: Column(
          children: [
            const WebAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding:const EdgeInsets.only(right: 50.0, left:8.0, top: 8.0, bottom: 8.0),
                  child: Row( 
                    children: [
                      Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
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
      ),
    );
  }
}
