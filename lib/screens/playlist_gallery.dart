import 'package:flutter/material.dart';
import '../widgets/gallery_view.dart';

class PlaylistGallery extends StatelessWidget {
  static const List<String> _exerciseList = [
    'Exercise 1',
    'Exercise 2',
    'Exercise 3',
    'Exercise 4',
    'Exercise 5',
    'Exercise 6',
    'Exercise 7'
  ];

  const PlaylistGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Playlist gallery'),
        ),
        body:
            const Gallery(exerciseList: _exerciseList, playlistGallery: true));
  }
}
