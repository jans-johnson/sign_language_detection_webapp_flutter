import 'package:flutter/material.dart';
import 'package:sign_language_detection_webapp_flutter/about_page/tech_used.dart';
import 'package:sign_language_detection_webapp_flutter/theme/theme_config.dart';
import 'package:sign_language_detection_webapp_flutter/utils/consts.dart';
import 'package:sign_language_detection_webapp_flutter/widgets/appbar.dart';
import 'dart:js' as js;
import 'package:simple_icons/simple_icons.dart';

class ScreenAbout extends StatefulWidget {
  const ScreenAbout({super.key});

  @override
  State<ScreenAbout> createState() => _ScreenAboutState();
}

class _ScreenAboutState extends State<ScreenAbout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(children: [
              WebAppBar(),
              Text(
                "About",
                style: TextStyle(
                    color: ThemeConfig.lightPrimary,
                    fontSize: MediaQuery.of(context).textScaleFactor * 60),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  Constants.about,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                      color: ThemeConfig.lightPrimary,
                      fontSize: MediaQuery.of(context).textScaleFactor * 15,
                      height: MediaQuery.of(context).textScaleFactor * 1.5,
                      wordSpacing: MediaQuery.of(context).textScaleFactor * 2),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              TechnologyUsed(),
              Text(
                "Meet the Team",
                style: TextStyle(
                    color: ThemeConfig.lightPrimary,
                    fontSize: MediaQuery.of(context).textScaleFactor * 50),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildCard(
                      'https://avatars.githubusercontent.com/u/62547901?v=4',
                      'Jans Johnson',
                      'https://github.com/jans-johnson',
                      'https://www.linkedin.com/in/jans-johnson/'),
                  _buildCard(
                      'https://avatars.githubusercontent.com/u/69690573?v=4',
                      'Jisha Joseph',
                      'https://github.com/jamiebit',
                      'https://www.linkedin.com/in/jisha-joseph-arp/'),
                  _buildCard(
                      'https://avatars.githubusercontent.com/u/69074049?v=4',
                      'Maris Reji',
                      'https://github.com/marisreji',
                      'https://www.linkedin.com/in/maris-reji-17262b225/'),
                  _buildCard(
                      'https://avatars.githubusercontent.com/u/84610299?v=4',
                      'Megha George',
                      'https://github.com/meghaeg77',
                      'https://www.linkedin.com/in/megha-george-453a76200/')
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Card _buildCard(String imageUrl, String name, String git, String linkedin) {
    return Card(
      elevation: 15,
      shadowColor: Colors.white,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.12,
          padding: EdgeInsets.all(20),
          color: ThemeConfig.darkPrimary,
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.04,
                  backgroundImage: NetworkImage(imageUrl),
                  backgroundColor: Colors.transparent,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ThemeConfig.lightPrimary,
                        fontSize: MediaQuery.of(context).textScaleFactor * 20)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      js.context.callMethod('open', [git]);
                    },
                    icon: const Icon(SimpleIcons.github,
                    color: Colors.white),
                  ),
                  IconButton(
                      onPressed: () {
                        js.context.callMethod('open', [linkedin]);
                      },
                      icon: Icon(SimpleIcons.linkedin,
                      color: Colors.white))
                ],
              )
            ],
          ),
        ),
    );
  }
}
