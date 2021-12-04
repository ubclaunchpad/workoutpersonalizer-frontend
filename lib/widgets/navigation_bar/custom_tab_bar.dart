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
    return Padding(
      padding: EdgeInsets.only(left: screenWidth * 0.05),
      child: SizedBox(
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
    );
  }
}
