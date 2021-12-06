import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/constants/styles.dart';
import 'package:workoutpersonalizer_frontend/models/exercise.dart';
import 'package:workoutpersonalizer_frontend/models/workout.dart';
import 'package:workoutpersonalizer_frontend/widgets/my_workouts/workout_card.dart';

class WorkoutCards extends StatefulWidget {
  const WorkoutCards({Key? key}) : super(key: key);

  @override
  _WorkoutCardsState createState() => _WorkoutCardsState();
}

class _WorkoutCardsState extends State<WorkoutCards> {
  final List<WorkoutCard> _workoutCards = <WorkoutCard>[];
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(child: _buildWorkoutCards());
  }

  Widget _buildWorkoutCards() {
    // TODO: Get actual workouts from backend (WP-55)
    final workouts = [
      Workout(
          "TestId",
          "b70820ae-d0a3-411b-9217-0bf2370e7139",
          "15 Minutes to Intense Abs",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+1+Thumbnail.png",
          [Exercise()],
          Duration(seconds: 510),
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          DateTime.now()),
      Workout(
          "TestId",
          "b70820ae-d0a3-411b-9217-0bf2370e7139",
          "5 Minute Stretch",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Clip+1+Thumbnail.png",
          [Exercise()],
          Duration(seconds: 240),
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          DateTime.now()),
    ];
    for (final workout in workouts) {
      _workoutCards.add(WorkoutCard(workout: workout));
    }

    if (_workoutCards.isEmpty) {
      return const SizedBox(
        height: 365,
        child: Text(
            "It looks like you haven't created any workouts yet."
            "Click the top right plus icon to get started.",
            style: h2
        )
      );
    }
    // TODO: Build _workoutCards on demand (WP-53)
    return Scrollbar(
        isAlwaysShown: true,
        controller: _scrollController,
        child: SizedBox(
            height: 380,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                controller: _scrollController,
                itemCount: _workoutCards.length,
                padding: const EdgeInsets.only(bottom: 15),
                itemBuilder: (context, index) => _workoutCards[index])));
  }
}
