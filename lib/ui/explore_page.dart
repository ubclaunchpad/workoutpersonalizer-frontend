import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/widgets/sidelayout.dart';
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
    'Exercise 7'
  ];

  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: const <Widget>[
      SideLayout(),
      Expanded(
          flex: 4,
          child: Gallery(exerciseList: _exerciseList, playlistGallery: true))
    ]);

    // return const Center(
    //     child: Gallery(exerciseList: _exerciseList, playlistGallery: true));
    // return Scaffold(
    //     key: Sidebar(),
    //     appBar: AppBar(
    //       title: const Text('Playlist gallery'),
    //     ),
    //     body:
    //         const Gallery(exerciseList: _exerciseList, playlistGallery: true));
  }
}
