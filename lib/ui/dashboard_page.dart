import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: WP-7 (ubclaunchpad.atlassian.net/browse/WP-7)
    return Center(
      child: Container(
        child: const Text(
          "Dashboard Page",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
