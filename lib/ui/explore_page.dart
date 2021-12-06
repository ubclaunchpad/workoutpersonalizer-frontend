import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/models/exercise.dart';
import 'package:workoutpersonalizer_frontend/widgets/sidelayout.dart';
import '../widgets/explore/gallery_view.dart';

class ExplorePage extends StatelessWidget {
  static List<Exercise> allExercises = [
    Exercise(
        1,
        "Crunch",
        "Exercise1 Description",
        "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+1+Thumbnail.png",
        "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+1+.mp4",
        1,
        ["abs", "legs"]),
    Exercise(
        2,
        "Flutter Kicks",
        "Exercise2 Description",
        "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+2+Thumbnail.png",
        "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+2.mp4",
        1,
        ["abs"]),
    Exercise(
        3,
        "Scissor Kicks",
        "Exercise3 Description",
        "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+3+Thumbnail.png",
        "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+3.mp4",
        10,
        ["abs"]),
    Exercise(
        4,
        "Ab Hold",
        "Exercise4 Description",
        "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+4+Thumbnail.png",
        "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+4.mp4",
        60,
        ["abs"]),
    Exercise(
        5,
        "Push Ups",
        "Exercise5 Description",
        "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+5+Thumbnail+.png",
        "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+5.mp4",
        90,
        ["abs"]),
    Exercise(
        6,
        "1 Arm 1 Leg Reach Out",
        "Exercise6 Description",
        "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+6+Thumbnail.png",
        "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+6.mp4",
        120,
        ["abs"]),
    Exercise(
        7,
        "Plank & Crunch Left",
        "Exercise7 Description",
        "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+7+Thumbnail.png",
        "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+7.mp4",
        191,
        ["abs"]),
    Exercise(
        8,
        "Plank & 3 Elbow Taps",
        "Exercise8 Description",
        "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+8+Thumbnail.png",
        "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+8.mp4",
        1000,
        ["abs"]),
    Exercise(
        9,
        "Plank & Pike",
        "Exercise9 Description",
        "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+9+Thumbnail.png",
        "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+9.mp4",
        191,
        ["abs"]),
    Exercise(
        10,
        "Elbow Plank",
        "Exercise10 Description",
        "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+10+Thumbnail.png",
        "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+10.mp4",
        1000,
        ["abs"]),
    Exercise(
        11,
        "Side Plank Left",
        "Exercise11 Description",
        "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+11+Thumbnail.png",
        "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+11.mp4",
        1000,
        ["abs"]),
    Exercise(
        12,
        "Side Plank Right",
        "Exercise12 Description",
        "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+12+Thumbnail.png",
        "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+12.mp4",
        1000,
        ["abs"]),
    Exercise(
        12,
        "Lean Back & Russian Twist",
        "Exercise13 Description",
        "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+13+Thumbnail+.png",
        "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+13.mp4",
        1000,
        ["abs"]),
  ];

  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      SideLayout(),
      //TODO: fix overflowing issues with small window size (https://ubclaunchpad.atlassian.net/browse/WP-74)
      const VerticalDivider(
        color: Color(0xFFDADADA),
        thickness: 2,
      ),
      Expanded(
          flex: 6,
          child: Container(
              padding: const EdgeInsets.all(20),
              child:
                  Gallery(exerciseList: allExercises, playlistGallery: true)))
    ]);
  }
}
