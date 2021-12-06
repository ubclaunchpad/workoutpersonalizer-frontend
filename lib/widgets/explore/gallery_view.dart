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
            childAspectRatio: 8 / 7,
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
              child: createExerciseCard(exercisesToDisplay, index, true)
              // child: Card(
              //   semanticContainer: true,
              //   clipBehavior: Clip.antiAliasWithSaveLayer,
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.stretch,
              //     children: <Widget>[
              //       ListTile(
              //         title: Text(exercisesToDisplay[index]),
              //         tileColor: Theme.of(context).primaryColor,
              //       ),
              //       Stack(alignment: Alignment.bottomLeft, children: <Widget>[
              //         AspectRatio(
              //           aspectRatio: 1.9,
              //           child: Image.asset(
              //             'images/pushup.jpg',
              //             fit: BoxFit.cover,
              //           ),
              //         ),
              //         Positioned(
              //             top: 0.0,
              //             right: 0.0,
              //             child: Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: PopupMenuButton(
              //                   onSelected: (value) {
              //                     _addToWorkouts(value);
              //                   },
              //                   itemBuilder: (context) => [
              //                     const PopupMenuItem(
              //                       child: Text("First"),
              //                       value: "first",
              //                     ),
              //                     const PopupMenuItem(
              //                       child: Text("Second"),
              //                       value: "second",
              //                     )
              //                   ],
              //                   child: Container(
              //                     decoration: BoxDecoration(
              //                         border: Border.all(
              //                           color: Colors.black,
              //                         ),
              //                         borderRadius: const BorderRadius.all(
              //                             Radius.circular(5))),
              //                     child: Container(
              //                       padding: const EdgeInsets.symmetric(
              //                           horizontal: 5.0, vertical: 3.0),
              //                       child: const Text('ADD',
              //                           textAlign: TextAlign.center,
              //                           style: TextStyle(
              //                               color: Color(0xFF000000))),
              //                     ),
              //                   ),
              //                 ))),
              //         Positioned(
              //             top: 25,
              //             right: 0,
              //             child: Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: IconButton(
              //                   onPressed: () {
              //                     _addToLibrary();
              //                   },
              //                   icon: const Icon(Icons.favorite),
              //                 )))
              //       ]),
              //       Padding(
              //           padding: const EdgeInsets.all(8),
              //           child: Align(
              //               alignment: Alignment.centerLeft,
              //               child: Text(
              //                 '#' + tagList[index],
              //                 style: TextStyle(
              //                     color: Colors.black.withOpacity(0.6)),
              //               ))),
              //     ],
              //   ),
              // )
              );
        });
  }

  Widget _buildSearchBar(BuildContext context, exerciseList) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: const InputDecoration(hintText: 'Search Exercise'),
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
      _buildSearchBar(context, widget.exerciseList),
      Expanded(
          child:
              _buildGrid(context, widget.exerciseList, widget.playlistGallery))
    ]);
  }
}
