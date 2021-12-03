// Absolute pathing is used throughout this project
import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/app_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Workout Personalizer',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // builder: (_, child) => AppView(),
      home: AppView(),
    );
  }
}
