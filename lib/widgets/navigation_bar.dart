import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/widgets/navigation_item.dart';

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          const NavigationItem(title: 'Dashboard'),
          const NavigationItem(title: 'My Workouts'),
          const NavigationItem(title: "Creator's Corner"),
        ],
      ),
    );
  }
}
