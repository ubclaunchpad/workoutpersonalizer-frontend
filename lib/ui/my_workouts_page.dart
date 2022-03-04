import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/widgets/my_workouts/workout_cards.dart';
import 'package:workoutpersonalizer_frontend/widgets/my_workouts/exercise_cards.dart';
import 'package:workoutpersonalizer_frontend/constants/styles.dart';

class MyWorkoutsPage extends StatelessWidget {
  const MyWorkoutsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Column (
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text(
              'Workout Library',
              style: primaryHeadingStyle,
            ),
            trailing: IconButton(
              icon: const Icon(
                Icons.add_to_photos_outlined,
                color: turquoise
              ),
              onPressed: () {},
            ),
          ),
          const SizedBox(height: 10),
          const WorkoutCards(),
          const SizedBox(height: 30),
          const ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              'Saved Exercises',
              style: primaryHeadingStyle,
            ),
          ),
          const SizedBox(height: 10),
          const ExerciseCards(),
      ],)
    );
  }
}
