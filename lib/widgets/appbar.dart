import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:js' as js;
import 'package:sign_language_detection_webapp_flutter/theme/theme_config.dart';

class WebAppBar extends StatefulWidget {
  const WebAppBar({Key? key}) : super(key: key);

  @override
  _WebAppBarState createState() => _WebAppBarState();
}

class _WebAppBarState extends State<WebAppBar> {
  int _hoverIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Padding(
          padding: const EdgeInsets.only(left: 50.0,top: 20),
          child: Text("SignScribe",
            style: TextStyle(
              //fontFamily: GoogleFonts.sigmarOne().fontFamily,
              fontSize: MediaQuery.of(context).textScaleFactor*40,
              fontWeight: FontWeight.bold,
              color: ThemeConfig.lightAccent
            ),
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
                _buildButton(0, 'Github Link'),
                _buildButton(1, 'Paper Link'),
                _buildButton(2, 'About'),
                // add more buttons as needed
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButton(int index, String label) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hoverIndex = index),
      onExit: (_) => setState(() => _hoverIndex = -1),
      child: TextButton(
        onPressed: () {
          // handle onPressed event
          if(index==0)
          {
            js.context.callMethod('open', ['https://github.com/jans-johnson']);
          }
          else if(index==1)
          {

          }
          else if(index==2)
          {

          }
        },
        style: TextButton.styleFrom(
          foregroundColor: ThemeConfig.lightPrimary, elevation: 0,
          textStyle: TextStyle(
            decoration: TextDecoration.none,
            decorationColor: _hoverIndex == index ? Colors.blueAccent : Colors.transparent,
            decorationThickness: 3,
            decorationStyle: _hoverIndex == index ? TextDecorationStyle.wavy : TextDecorationStyle.solid,
          ),
        ),
        child: Text(label),
      ),
    );
  }
}
