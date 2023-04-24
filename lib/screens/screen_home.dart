import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  Colors.black,
                  Colors.deepPurple,
                  Colors.purple,
                  Colors.blue,
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
                            onPressed: () {}, child: const Text("Menu Item")),
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
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.05),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: MediaQuery.of(context).size.width * 0.01,),
                                Text(
                                  "Dynamic Sign Language Detection",
                                  style: TextStyle(
                                    fontFamily: GoogleFonts.roboto().fontFamily,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 92.0,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width * 0.01,
                                ),
                                Text(
                                  "The project aims to build a model that converts Indian Sign Language into corresponding words. We have used a skeletal-point feature extraction framework to identify hand landmarks from sequences containing distinct signs and use these landmarks to build a model for recognizing hand gestures using various Long Short-Term Memory (LSTM) Networks. This approach can produce an accurate result compared to the traditional approach. The user will be monitored  and using the machine learning techniques discussed above, which will perform the real-time translation to display the final result",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Color.fromARGB(185, 255, 255, 255),
                                    letterSpacing: 1.0,
                                    height: 2.0,
                                  ),
                                ),
                                Spacer(),
                                ElevatedButton(
                                    onPressed: () {},
                                    child: Text("Get Started")),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                            child: Container(
                          child: SvgPicture.asset(
                            "assets/home.svg",
                            width: MediaQuery.of(context).size.width * 0.4,
                          ),
                        ))
                      ],
                    ),
                  ),
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
