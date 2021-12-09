import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/models/exercise.dart';

class SavedExercises extends StatefulWidget {
  const SavedExercises({Key? key}) : super(key: key);

  @override
  _SavedExercisesState createState() => _SavedExercisesState();
}

class _SavedExercisesState extends State<SavedExercises> {
  @override
  Widget build(BuildContext context) {
    return Container(child: _buildExerciseCards());
  }

  Widget _buildExerciseCards() {
    // TODO: Get actual saved exercises from backend (https://ubclaunchpad.atlassian.net/browse/WP-93)
    final exercises = [
      Exercise(
          18,
          "Plank + Pike",
          "desc18",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+9+Thumbnail.png",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+9+.mp4",
          30,
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          ['abs']),
      Exercise(
          19,
          "Elbow Plank",
          "desc19",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+10+Thumbnail.png",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+10+.mp4",
          30,
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          ['abs']),
      Exercise(
          20,
          "Side Plank Left",
          "desc20",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+11+Thumbnail.png",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+11+.mp4",
          30,
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          ['abs']),
      Exercise(
          21,
          "Side Plank Right",
          "desc21",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+12+Thumbnail.png",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+12+.mp4",
          30,
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          ['abs']),
      Exercise(
          22,
          "Lean Back + Russian Twist",
          "desc22",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+13+Thumbnail+.png",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+13+.mp4",
          30,
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          ['abs']),
      Exercise(
          23,
          "Mountain Climber",
          "desc23",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+13+Thumbnail+.png",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+13+.mp4",
          30,
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          ['abs']),
      Exercise(
          24,
          "Plank Jump",
          "desc24",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+13+Thumbnail+.png",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+13+.mp4",
          30,
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          ['abs']),
      Exercise(
          25,
          "Twisting Mountain Climber",
          "desc25",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+13+Thumbnail+.png",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+13+.mp4",
          30,
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          ['abs']),
    ];

    // TODO: Build exerciseCards on demand (https://ubclaunchpad.atlassian.net/browse/WP-94)
    // TODO: Create listview of exercise cards (ubclaunchpad.atlassian.net/browse/WP-58)
    return Container();
  }
}
