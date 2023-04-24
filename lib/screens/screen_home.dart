import 'dart:ui';
import 'dart:js' as js;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sign_language_detection_webapp_flutter/theme/theme_config.dart';
import 'package:sign_language_detection_webapp_flutter/widgets/neon_button.dart';

import '../utils/consts.dart';

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
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.onPrimary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.onSecondary,
                ])),
          ),
          Center(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 2,
                sigmaY: 2,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.9,
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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              js.context.callMethod(
                                  'open', ['https://github.com/jans-johnson']);
                            },
                            child: const Text("Github")),
                        TextButton(
                            onPressed: () {}, child: const Text("Menu Item")),
                        TextButton(
                            onPressed: () {}, child: const Text("Menu Item")),
                      ],
                    ),
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
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width * 0.01,
                                ),
                                Text(
                                  "Dynamic Sign Language Detection",
                                  style: TextStyle(
                                    fontFamily: GoogleFonts.roboto().fontFamily,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).textScaleFactor *
                                            60,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width * 0.01,
                                ),
                                Text(
                                  Constants.main_page_desc,
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).textScaleFactor *
                                            10,
                                    color: Color.fromARGB(185, 255, 255, 255),
                                    letterSpacing: 1.0,
                                    height: 1.5,
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                            child: Container(
                          child: SvgPicture.asset(
                            "assets/home.svg",
                            width: MediaQuery.of(context).size.width * 0.55,
                          ),
                        ))
                      ],
                    ),
                  ),
                  NeonButton(label: "Get Started", onPressed: (){}),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.facebook)),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.youtube_searched_for)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.home)),
                    ],
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
