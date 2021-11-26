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
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      builder: (context, child) {
        return Overlay(
          initialEntries: [
            OverlayEntry(builder: (_) => const AppView()),
          ],
        );
      }
    );
  }
}
