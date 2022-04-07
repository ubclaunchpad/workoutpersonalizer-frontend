import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/constants/styles.dart';
import 'package:workoutpersonalizer_frontend/models/exercise.dart';
import 'package:workoutpersonalizer_frontend/widgets/my_workouts/exercise_card.dart';

class ExerciseCards extends StatefulWidget {
  const ExerciseCards({Key? key}) : super(key: key);

  @override
  _ExerciseCardsState createState() => _ExerciseCardsState();
}

class _ExerciseCardsState extends State<ExerciseCards> {
  final List<ExerciseCard> _exerciseCards = <ExerciseCard>[];
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(child: _buildExerciseCards());
  }

  Widget _buildExerciseCards() {
    // TODO: Get actual exercises from backend (ubclaunchpad.atlassian.net/browse/WP-93)
    final exercises = [
      Exercise(
        1,
        "Side to Side Stretch",
        "Stretch from side to side!",
        "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Clip+1+Thumbnail.png",
        "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Clip+1.mp4",
        30,
        DateTime.parse("2021-11-23 13:02:51.023-08"),
        DateTime.parse("2021-11-23 13:02:51.023-08"),
        []
      ),
      Exercise(
        2,
        "Arm Circles",
        "Circular arms!",
        "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Clip+2+Thumbnail.png",
        "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Clip+2.mp4",
        30,
        DateTime.parse("2021-11-23 13:02:51.023-08"),
        DateTime.parse("2021-11-23 13:02:51.023-08"),
        []
      ),
    ];
    for (final exercise in exercises) {
      _exerciseCards.add(ExerciseCard(exercise: exercise));
    }

    if (_exerciseCards.isEmpty) {
      return const SizedBox(
        height: 365,
        child: Text(
            "It looks like you haven't created any exercises yet."
            "Click the top right plus icon to get started.",
            style: secondaryHeadingStyle,
        )
      );
    }
    // TODO: Build _exerciseCards on demand (ubclaunchpad.atlassian.net/browse/WP-94)
    return Scrollbar(
        isAlwaysShown: true,
        controller: _scrollController,
        child: SizedBox(
            height: 380,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                controller: _scrollController,
                itemCount: _exerciseCards.length,
                padding: const EdgeInsets.only(bottom: 15),
                itemBuilder: (context, index) => _exerciseCards[index])));
  }
}
