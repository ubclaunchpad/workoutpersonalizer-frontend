// Absolute pathing is used throughout this project
import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/app_view.dart';
import 'package:workoutpersonalizer_frontend/routes/routes.dart';
import 'package:workoutpersonalizer_frontend/routes/routes_generator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Workout Personalizer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      builder: (_, child) => AppView(
        child: child!,
      ),
      // Where the program will start when first opened
      initialRoute: routeDashboard,
      // Used to switch between pages without having a context
      navigatorKey: navKey,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
