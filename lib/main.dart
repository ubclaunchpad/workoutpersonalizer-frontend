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
      title: 'Navigation Bar Web',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      builder: (_, child) => AppView(
        child: child!,
      ),
      initialRoute: routeDashboard,
      navigatorKey: navKey,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
