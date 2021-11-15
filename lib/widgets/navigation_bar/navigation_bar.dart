import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/routes/routes.dart';
import 'package:workoutpersonalizer_frontend/widgets/navigation_bar/navigation_item.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: const [
          NavigationItem(
            title: 'My Workouts',
            routeName: myWorkoutsRoute,
          ),
          NavigationItem(
            title: 'Explore',
            routeName: exploreRoute,
          ),
          NavigationItem(
            title: 'Dashboard',
            routeName: routeDashboard,
          ),
          NavigationItem(
            title: "Creator's Corner",
            routeName: creatorsCornerRoute,
          ),
        ],
      ),
      color: Colors.brown[50],
    );
  }
}
