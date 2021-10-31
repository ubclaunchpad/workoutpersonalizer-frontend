import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/routes/routes.dart';
import 'package:workoutpersonalizer_frontend/widgets/navigation_item.dart';

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
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: const [
          NavigationItem(
            title: 'Dashboard',
            routeName: routeDashboard,
          ),
          NavigationItem(
            title: 'My Workouts',
            routeName: routeMyWorkouts,
          ),
          NavigationItem(
            title: "Creator's Corner",
            routeName: routeCreatorsCorner,
          ),
        ],
      ),
      color: Colors.brown[50],
    );
  }
}
