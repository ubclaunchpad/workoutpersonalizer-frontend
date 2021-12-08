import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/widgets/creators_corner/exercise_library.dart';
import 'package:workoutpersonalizer_frontend/widgets/creators_corner/workout_editor.dart';
import 'package:workoutpersonalizer_frontend/widgets/creators_corner/workout_viewer.dart';

class CreatorsCornerPage extends StatelessWidget {
  const CreatorsCornerPage({Key? key}) : super(key: key);

  static const int flexScaleWorkoutEditor = 4;
  static const int flexScaleWorkoutViewerAndExerciseLibrary = 6;
  static const int flexScaleWorkoutViewer = 4;
  static const int flexScaleExerciseLibrary = 6;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: flexScaleWorkoutViewerAndExerciseLibrary,
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Expanded(
                  flex: flexScaleWorkoutViewer,
                  child: WorkoutViewer(),
                ),
                const VerticalDivider(
                    color: Color(0xFFDADADA),
                    thickness: 2,
                ),
                Expanded(
                  flex: flexScaleExerciseLibrary,
                  child: ExerciseLibrary(),
                ),
              ],
            ),
          ),
        ),
        const Expanded(
          flex: flexScaleWorkoutEditor,
          child: WorkoutEditor(),
        ),
      ],
    );
  }
}