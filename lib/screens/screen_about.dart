import 'package:flutter/material.dart';
import 'package:sign_language_detection_webapp_flutter/utils/consts.dart';
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
      body: Center(
        child: Column(children: [
          Text("About",
          style: TextStyle(
                fontSize: MediaQuery.of(context).textScaleFactor * 60),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(Constants.about),
          ),
          Text(
            "Meet the Team",
            style: TextStyle(
                fontSize: MediaQuery.of(context).textScaleFactor * 50),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
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
    );
  }

  Card _buildCard(String imageUrl, String name, String git, String linkedin) {
    return Card(
      elevation: 20,
      shadowColor: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
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
                      fontSize: MediaQuery.of(context).textScaleFactor * 20)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    js.context.callMethod('open', [git]);
                  },
                  icon: const Icon(SimpleIcons.github),
                ),
                IconButton(
                    onPressed: () {
                      js.context.callMethod('open', [linkedin]);
                    },
                    icon: Icon(SimpleIcons.linkedin))
              ],
            )
          ],
        ),
      ),
    );
  }
}
