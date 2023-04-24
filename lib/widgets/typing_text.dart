import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TypingTextWidget extends StatelessWidget {
  final String text;

  TypingTextWidget({required this.text});

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
              fontFamily: GoogleFonts.roboto().fontFamily,
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).textScaleFactor * 60,
              color: Colors.white,
            ),
            speed: Duration(milliseconds: 100),
          ),
        ],
      ),
    );
  }
}
