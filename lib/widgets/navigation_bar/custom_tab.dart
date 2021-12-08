import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/constants/styles.dart';

class CustomTab extends StatelessWidget {
  CustomTab({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Text(
          title,
          style: navBarItemStyle,
        ),
      ),
    );
  }
}
