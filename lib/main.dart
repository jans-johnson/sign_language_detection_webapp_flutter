import 'package:flutter/material.dart';
import 'package:sign_language_detection_webapp_flutter/screens/screen_home.dart';
import 'package:sign_language_detection_webapp_flutter/theme/theme_config.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScreenHome(),
      theme: ThemeConfig.darkTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
