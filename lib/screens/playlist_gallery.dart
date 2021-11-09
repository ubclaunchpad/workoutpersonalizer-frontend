import 'package:flutter/material.dart';
import '../widgets/gallery_view.dart';

class PlaylistGallery extends StatelessWidget {
  static const List<String> _exerciseList = [
    'exercise1',
    'exercise2',
    'exercise3',
    'exercise4',
    'exercise5',
    'exercise6',
    'exercise7'
  ];

  const PlaylistGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Playlist gallery'),
        ),
        body: Gallery(exerciseList: _exerciseList)
        // body: Center(
        //   child: ElevatedButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     child: const Text('Go back!'),
        //   ),
        // ),
        );
  }
}
