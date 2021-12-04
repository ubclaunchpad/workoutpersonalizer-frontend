import 'package:flutter/material.dart';

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
      color: const Color(0xFFFFA101),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(screenWidth * 0.03, 5, 110, 5),
            child: const SizedBox(
              width: 100,
              height: 30,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0xFF827373),
                ),
              ),
            )
          ),
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
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF9D9494),
            ),
          ),
        ],
      ),
    );
    
    // return Padding(
    //   padding: EdgeInsets.only(left: screenWidth * 0.05),
    //   child: SizedBox(
    //     width: screenWidth * tabBarScaling,
    //     child: Theme(
    //       data: ThemeData(
    //         highlightColor: Colors.transparent,
    //         splashColor: Colors.transparent,
    //         hoverColor: Colors.transparent,
    //       ),
    //       child: TabBar(
    //         controller: controller,
    //         tabs: tabs,
    //         indicatorColor: const Color(0xFFFAE6B1),
    //       ),
    //     ),
    //   ),
    // );
  }
}
