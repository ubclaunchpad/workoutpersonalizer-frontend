import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/widgets/creators_corner/exercise_library.dart';
import 'package:workoutpersonalizer_frontend/widgets/creators_corner/workout_editor.dart';
import 'package:workoutpersonalizer_frontend/widgets/creators_corner/workout_viewer.dart';

class CreatorsCornerPage extends StatelessWidget {
  const CreatorsCornerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 6,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Expanded(
                flex: 4,
                child: WorkoutViewer(),
              ),
              Expanded(
                flex: 6,
                child: ExerciseLibrary(),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: WorkoutEditor(),
        ),
      ],
    );
  }
}
