import 'package:flutter/material.dart';
import '../widgets/gallery_view.dart';
import '../widgets/sidebar.dart';

class ExplorePage extends StatelessWidget {
  static const List<String> _exerciseList = [
    'Exercise 1',
    'Exercise 2',
    'Exercise 3',
    'Exercise 4',
    'Exercise 5',
    'Exercise 6',
  ];

  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Gallery(exerciseList: _exerciseList, playlistGallery: true));
  }
}
