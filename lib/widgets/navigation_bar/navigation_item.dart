import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/constants/styles.dart';
import 'package:workoutpersonalizer_frontend/routes/routes.dart';

class NavigationItem extends StatelessWidget {
  final String title;
  final String routeName;

  const NavigationItem({required this.title, required this.routeName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navKey.currentState?.pushNamed(routeName);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Text(
            title,
            style: navBarItemStyle,
          ),
        ),
      ),
    );
  }
}
