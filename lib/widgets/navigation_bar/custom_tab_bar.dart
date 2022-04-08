import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/constants/styles.dart';

class CustomTabBar extends StatelessWidget {
  CustomTabBar({required this.controller, required this.tabs});

  final TabController controller;
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double tabBarScaling = screenWidth > 1400
        ? 0.3
        : screenWidth > 1100
            ? 0.4
            : 0.45;
    return Container(
      color: orange,
      child: Row(
        children: <Widget>[
          const Image(image: NetworkImage('https://teamworkoutplatform.s3.us-west-2.amazonaws.com/fithubhoriz+(1).png'),
          width: 200, height: 100,),
          SizedBox(
            width: screenWidth * tabBarScaling,
            child: Theme(
              data: ThemeData(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
              child: TabBar(
                controller: controller,
                tabs: tabs,
                indicatorColor: const Color(0xFFFAE6B1),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF9D9494),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
