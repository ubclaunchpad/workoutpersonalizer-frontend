import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/models/exercise.dart';
import 'package:workoutpersonalizer_frontend/widgets/exercise_card.dart';
import 'package:workoutpersonalizer_frontend/widgets/explore/card_dialog.dart';

class Gallery extends StatefulWidget {
  final List<Exercise> exerciseList;
  final bool playlistGallery;

  const Gallery(
      {Key? key, required this.exerciseList, required this.playlistGallery})
      : super(key: key);

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  List<Exercise> exercisesToDisplay = [];

  @override
  void initState() {
    super.initState();
    exercisesToDisplay = widget.exerciseList;
  }

  void _addToWorkouts(value) {
    print("this is value " + value);
  }

  void _addToLibrary() {
    print("add to library");
  }

  List<Exercise> _getDisplayItems(text, exerciseList) {
    List<Exercise> ret = [];
    exerciseList.forEach((Exercise exercise) {
      if (exercise.name.toLowerCase().contains(text)) {
        ret.add(exercise);
      }
    });
    return ret;
  }

  Widget _buildGrid(BuildContext context, exerciseList, playlistGallery) {
    return GridView.builder(
        controller: ScrollController(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 9 / 7,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: exercisesToDisplay.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () async {
                await showDialog(
                    context: context,
                    builder: (_) => ExerciseDialog(exerciseList[index]));
              },
              child: createExerciseCard(exercisesToDisplay, index, true, true));
        });
  }

  Widget _buildSearchBar(BuildContext context, exerciseList) {
    //TODO: search bar fixes (https://ubclaunchpad.atlassian.net/browse/WP-121)
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: const InputDecoration(
            suffixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            hintText: 'Search Exercise',
            border: OutlineInputBorder(borderRadius: BorderRadius.zero),
            contentPadding: EdgeInsets.only(left: 10, right: 10)),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            exercisesToDisplay = _getDisplayItems(text, exerciseList);
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          alignment: Alignment.center,
          width: 300,
          child: _buildSearchBar(context, widget.exerciseList)),
      Expanded(
          child:
              _buildGrid(context, widget.exerciseList, widget.playlistGallery))
    ]);
  }
}
