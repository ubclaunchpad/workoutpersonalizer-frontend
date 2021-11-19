import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  CustomTab({required this.title});

  final String title;

  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        title,
        style: const TextStyle(fontSize: 17, color: Colors.black),
      ),
    );
  }
}
