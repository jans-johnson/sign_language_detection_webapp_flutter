import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:js' as js;
import 'package:sign_language_detection_webapp_flutter/theme/theme_config.dart';
import 'package:sign_language_detection_webapp_flutter/widgets/neon_hover_text.dart';

class WebAppBar extends StatelessWidget {
  int _hoverIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 50.0, top: 20),
            child: 
            Text(
              "SignScribe",
              style: TextStyle(
                  //fontFamily: GoogleFonts.sigmarOne().fontFamily,
                  fontSize: MediaQuery.of(context).textScaleFactor * 40,
                  fontWeight: FontWeight.bold,
                  color: ThemeConfig.lightAccent),
                  
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.transparent,
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NeonHoverText(
                  text: "Github",
                  onPressed: () {
                    js.context.callMethod(
                        'open', ['https://github.com/jans-johnson']);
                  },
                  fontSize: MediaQuery.of(context).textScaleFactor * 15,
                ),
                NeonHoverText(
                  text: "Paper",
                  onPressed: () {},
                  fontSize: MediaQuery.of(context).textScaleFactor * 15,
                ),
                NeonHoverText(
                  text: "About",
                  onPressed: () {
                    Navigator.of(context).pushNamed("ScreenAbout");
                  },
                  fontSize: MediaQuery.of(context).textScaleFactor * 15,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
