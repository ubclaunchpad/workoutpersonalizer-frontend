import 'package:flutter/material.dart';
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
    for (var i = 0; i < 10; i++) {
      final workout = Workout("TestId$i", "TestUserId$i", "Test Workout $i",
        "https://picsum.photos/250?image=9", [Exercise()], Duration(minutes: i),
        DateTime.now(), DateTime.now(), DateTime.now());
      _workoutCards.add(WorkoutCard(workout: workout));
    }

    if (_workoutCards.isEmpty) {
      return const SizedBox(
        height: 365,
        child: Text("Oops, it looks like you haven't created any workouts yet")
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
          itemBuilder: (context, index) => _workoutCards[index]
        )
      )
    );
  }
}
