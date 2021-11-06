import 'package:flutter/material.dart';
import '../widgets/gallery_view.dart';

class PlaylistGallery extends StatelessWidget {
  const PlaylistGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Playlist gallery'),
        ),
        body: const Gallery()
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
