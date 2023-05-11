import 'package:camera/camera.dart';

class DetectionFunction {
  DetectionFunction._internal();
  static DetectionFunction instance = DetectionFunction._internal();

  factory DetectionFunction() {
    return instance;
  }

  List<CameraDescription>? cameras;
  CameraController? controller;
  String? image=null;
}
