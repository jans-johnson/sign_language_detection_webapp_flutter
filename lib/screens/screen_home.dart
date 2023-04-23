import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xE3000000),
                          Color(0x8506087A),
                        ])),
                child: Column(children: [
                  Row(
                    children: [
                      Text("Menu Item"),

                    ],
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Text(
                                  "Dynamic Sign Language Detection\n Using Skeletal Point Recogniton"),
                              Text(
                                  " sdlfjalksd d fas;dlf jas;ldasf asdifa;spdfj a;sdkfj pasd flsjd l;adjhsajsjfladf dsfh"),
                              Spacer(),
                              ElevatedButton(
                                  onPressed: () {}, child: Text("Get Started")),
                              Row(
                                children: [
                                  CircleAvatar(
                                    maxRadius: 5,
                                  ),
                                  CircleAvatar(
                                    maxRadius: 5,
                                  ),
                                  CircleAvatar(
                                    maxRadius: 5,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                            child: Container(
                          child: SvgPicture.asset("assets/home.svg",
                          s),
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
