import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/constants/styles.dart';

class CustomTab extends StatelessWidget {
  final String title;
  const CustomTab({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: FittedBox(
        fit: BoxFit.fill,
        child: Text(
          title,
          style: navBarItemStyle,
        ),
      ),
    );
  }
}
