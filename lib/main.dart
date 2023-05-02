import 'package:flutter/material.dart';
import 'package:sign_language_detection_webapp_flutter/about_page/screen_about.dart';
import 'package:sign_language_detection_webapp_flutter/detection_page/screen_detect.dart';
import 'package:sign_language_detection_webapp_flutter/home_page/screen_home.dart';
import 'package:sign_language_detection_webapp_flutter/theme/theme_config.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ScreenHome(),
      theme: ThemeConfig.darkTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        'ScreenHome' : (context) {
          return const ScreenHome();
        },
        'ScreenDetect': (ctx) {
          return const ScreenDetect();
        },
        'ScreenAbout': (ctx) {
          return const ScreenAbout();
        }
      },
    );
  }
}
