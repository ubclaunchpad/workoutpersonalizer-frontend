import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/constants/styles.dart';

class CustomTab extends StatelessWidget {
  CustomTab({required this.title});

  final String title;

  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        title,
        style: navBarItemStyle,
      ),
    );
  }
}
