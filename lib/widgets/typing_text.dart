import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class TypingTextWidget extends StatelessWidget {
  final String text;

  const TypingTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: AnimatedTextKit(
        totalRepeatCount: 1,
        animatedTexts: [
          TypewriterAnimatedText(
            text,
            textStyle: TextStyle(
              fontSize: MediaQuery.of(context).textScaleFactor * 20,
              color: const Color.fromARGB(185, 255, 255, 255),
              letterSpacing: 1.0,
              height: 1.5,
            ),
            speed: const Duration(milliseconds: 100),
          ),
        ],
      ),
    );
  }
}
