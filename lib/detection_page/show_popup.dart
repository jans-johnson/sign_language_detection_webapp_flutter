import 'package:flutter/material.dart';
import 'package:sign_language_detection_webapp_flutter/theme/theme_config.dart';

void showCustomPopup(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: ThemeConfig.darkPrimary,
        title: Text(
          'Detection Complete',
          style: TextStyle(
            color: ThemeConfig.lightPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          message,
          style: TextStyle(
            color: ThemeConfig.lightPrimary,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'OK',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );
    },
  );
}
