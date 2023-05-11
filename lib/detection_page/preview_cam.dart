import 'package:flutter/material.dart';

import '../theme/theme_config.dart';
import '../utils/consts.dart';

class PreviewCamera extends StatefulWidget {
  const PreviewCamera({super.key});

  @override
  State<PreviewCamera> createState() => _PreviewCameraState();
}

class _PreviewCameraState extends State<PreviewCamera> {

  @override
  void initState(){
    
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          Constants.instructions,
          overflow: TextOverflow.clip,
          style: TextStyle(
              color: ThemeConfig.lightPrimary,
              fontSize: MediaQuery.of(context).textScaleFactor * 15,
              height: MediaQuery.of(context).textScaleFactor * 1.5,
              wordSpacing: MediaQuery.of(context).textScaleFactor * 2),
        ),
        SizedBox(
          height: 200,
          width: 350,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }
}
