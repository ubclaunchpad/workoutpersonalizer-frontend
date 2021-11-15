import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/routes/routes.dart';
import 'package:workoutpersonalizer_frontend/ui/creators_corner_page.dart';
import 'package:workoutpersonalizer_frontend/ui/explore_page.dart';
import 'package:workoutpersonalizer_frontend/ui/my_workouts_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget pageDestination;
    switch (settings.name) {
      case exploreRoute:
        pageDestination = ExplorePage();
        break;
      case creatorsCornerRoute:
        pageDestination = CreatorsCornerPage();
        break;
      default:
        pageDestination = MyWorkoutsPage();
    }
    return MaterialPageRoute(builder: (_) => pageDestination);
  }
}
