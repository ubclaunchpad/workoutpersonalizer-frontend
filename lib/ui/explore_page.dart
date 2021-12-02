import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/widgets/sidelayout.dart';
import '../widgets/gallery_view.dart';
import '../widgets/sidebar.dart';

class ExplorePage extends StatelessWidget {
  static const List<String> _exerciseList = [
    'Pushup',
    'Crunch',
    'Neck Circles',
    'Hamstring Stretch',
    'Plank',
    'Hip Flexor Stretch',
  ];
  static const List<String> _descriptionList = [
    'Pushup Description',
    'Crunch Description',
    'Neck Circles Description',
    'Hamstring Stretch Description',
    'Plank Description',
    'Hip Flexor Stretch Description',
  ];
  static const List<String> _tagList = [
    'chest',
    'abs',
    'neck',
    'legs',
    'abs',
    'legs',
  ];
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      SideLayout(),
      const VerticalDivider(),
      Expanded(
          flex: 7,
          child: Container(
              padding: EdgeInsets.all(20),
              child: Gallery(
                  exerciseList: _exerciseList,
                  descriptionList: _descriptionList,
                  tagList: _tagList,
                  playlistGallery: true)))
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
