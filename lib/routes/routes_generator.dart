import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/routes/routes.dart';
import 'package:workoutpersonalizer_frontend/ui/creators_corner_page.dart';
import 'package:workoutpersonalizer_frontend/ui/dashboard_page.dart';
import 'package:workoutpersonalizer_frontend/ui/my_workouts_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeDashboard:
        return MaterialPageRoute(builder: (_) => DashboardPage());
        break;
      case routeMyWorkouts:
        return MaterialPageRoute(builder: (_) => MyWorkoutsPage());
        break;
      case routeCreatorsCorner:
        return MaterialPageRoute(builder: (_) => CreatorsCornerPage());
        break;
    }
  }
}
