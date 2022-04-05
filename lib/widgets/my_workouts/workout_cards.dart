import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/constants/styles.dart';
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
  late Future<List> futureWorkouts;

  @override
  void initState() {
    super.initState();
    futureWorkouts = fetchWorkouts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: futureWorkouts,
      builder: _buildWorkoutCards,
    );
  }

  Widget _buildWorkoutCards(BuildContext context, AsyncSnapshot<List> snapshot) {
    if (snapshot.hasData) {
      for (final workout in snapshot.data!) {
        _workoutCards.add(WorkoutCard(workout: workout));
      }

      if (_workoutCards.isEmpty) {
        return const SizedBox(
          height: 365,
          child: Text(
            "It looks like you haven't created any workouts yet."
            "Click the top right plus icon to get started.",
            style: secondaryHeadingStyle,
          )
        );
      }
      // TODO: Build _workoutCards on demand (ubclaunchpad.atlassian.net/browse/WP-53)
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
    } else if (snapshot.hasError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              )
            ],
        ),
      );
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Awaiting workouts...'),
            )
          ],
        ),
      );
    }
  }
}
