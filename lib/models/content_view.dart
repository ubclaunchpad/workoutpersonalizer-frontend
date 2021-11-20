import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/widgets/navigation_bar/custom_tab.dart';

class ContentView {
  ContentView({required this.tab, required this.content});

  final CustomTab tab;
  final Widget content;
}
