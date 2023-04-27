import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sign_language_detection_webapp_flutter/theme/theme_config.dart';
import 'package:sign_language_detection_webapp_flutter/widgets/appbar.dart';
import 'package:sign_language_detection_webapp_flutter/widgets/neon_button.dart';

import '../utils/consts.dart';
import '../widgets/typing_text.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  Theme.of(context).colorScheme.onSecondary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onPrimary,
                  Theme.of(context).colorScheme.primary,
                ])),
          ),
          Center(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 2,
                sigmaY: 2,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.95,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xE3000000),
                          Color.fromARGB(133, 0, 188, 221),
                        ])),
                child: Column(children: [
                  WebAppBar(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.05),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width * 0.01,
                                ),
                                Flexible(
                                  fit: FlexFit.tight,
                                  flex: 4,
                                  child: Text(
                                    "Dynamic Sign Language Recogniton",
                                    style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.roboto().fontFamily,
                                      fontWeight: FontWeight.bold,
                                      fontSize: MediaQuery.of(context)
                                              .textScaleFactor *
                                          60,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width * 0.01,
                                ),
                                Flexible(
                                    fit: FlexFit.loose,
                                    flex: 3,
                                    child: TypingTextWidget(
                                        text: Constants.main_page_desc)),
                                Spacer(),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: 
                            SvgPicture.asset(
                              "assets/home.svg",
                              width: MediaQuery.of(context).size.width * 0.50,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: NeonButton(label: "Get Started", onPressed: () {}),
                  )
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
