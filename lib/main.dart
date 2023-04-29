import 'package:flutter/material.dart';
import 'package:sign_language_detection_webapp_flutter/about_page/screen_about.dart';
import 'package:sign_language_detection_webapp_flutter/detection_page/screen_detect.dart';
import 'package:sign_language_detection_webapp_flutter/home_page/screen_home.dart';
import 'package:sign_language_detection_webapp_flutter/theme/theme_config.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScreenHome(),
      theme: ThemeConfig.darkTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        'ScreenDetect': (ctx) {
          return ScreenDetect();
        },
        'ScreenAbout': (ctx) {
          return ScreenAbout();
        }
      },
    );
  }
}
