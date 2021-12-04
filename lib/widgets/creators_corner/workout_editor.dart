import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/constants/styles.dart';
import 'package:workoutpersonalizer_frontend/models/exercise.dart';
import 'package:workoutpersonalizer_frontend/models/pair.dart';
import 'package:workoutpersonalizer_frontend/widgets/creators_corner/exercise_card.dart';

class WorkoutEditor extends StatefulWidget {
  const WorkoutEditor({Key? key}) : super(key: key);

  @override
  WorkoutEditorState createState() => WorkoutEditorState();
}

class WorkoutEditorState extends State<WorkoutEditor> {
  List<Exercise> chosenExercises = [];
  List<String> tagList = [];

  Widget writeText() {
    String body;
    if (chosenExercises.isEmpty) {
      body = "Drag a video to the editor to add to a workout.";
    } else {
      body = "Drag a video to the editor to add to the workout. Drag to re-order the videos.";
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(35, 10, 0, 0),
      child: Text(
        body,
        style: workoutEditorStyle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFA101),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              writeText(),
              const Spacer(),
              OutlinedButton(
                onPressed: () {
                  //TODO: implement adding break feature (WP-37)
                  print('Received Click');
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  backgroundColor: const Color(0xFF3CBFD4),
                ),
                child: const Text(
                  'SAVE',
                  style: TextStyle(
                    fontFamily: "BalooBhai2",
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: DragTarget<Pair<Exercise, String>>(
              builder: (BuildContext context, List<dynamic> accepted, List<dynamic> rejected) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 100, 90),
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 1,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20
                        ),
                    itemCount: chosenExercises.length,
                    itemBuilder: (context, index) {
                      return Draggable<Pair<Exercise, String>>(
                        data: Pair(chosenExercises[index], tagList[index]),
                        hitTestBehavior: HitTestBehavior.translucent,
                        feedback: createExerciseCardDraggable(chosenExercises, index, tagList),
                        child: createExerciseCardEditor(chosenExercises, index, tagList),
                      );
                    } 
                  ),
                );
              },
              onAccept: (Pair<Exercise, String> data) {
                setState(() {
                  chosenExercises.add(data.a);
                  tagList.add(data.b);
                });
              },
            ),
          ),
        ],
      ),
    );   
  }
}