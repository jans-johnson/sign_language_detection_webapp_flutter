import 'package:flutter/material.dart';

class SharedState extends ChangeNotifier {
  String? _image = null;

  String? get image => _image;

  void updateImage(String newImage) {
    _image = newImage;
    notifyListeners();
  }
}