import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/widgets/my_workouts/workout_cards.dart';

class MyWorkoutsPage extends StatelessWidget {
  const MyWorkoutsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Column (
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text(
              'Workout Library',
              style: TextStyle(fontSize: 20)
            ),
            trailing: OutlinedButton(
              onPressed: () {},
              child: const Text('Create New Workout'),
            )
          ),
          const SizedBox(height: 10),
          const WorkoutCards(),
          const SizedBox(height: 30),
          const ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              'Exercise Library',
              style: TextStyle(fontSize: 20)
            ),
          ),
          const SizedBox(height: 10),
          // TODO: Add exercise cards (WP-58)
      ],)
    );
  }
}
