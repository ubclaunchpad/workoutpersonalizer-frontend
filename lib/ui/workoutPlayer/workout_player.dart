import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:workoutpersonalizer_frontend/ui/workoutPlayer/models/Exercise.dart';

import 'video_player.dart';

class WorkoutPlayer extends StatefulWidget {
  const WorkoutPlayer({Key? key}) : super(key: key);

  @override
  State<WorkoutPlayer> createState() => _WorkoutPlayer();
}

class _WorkoutPlayer extends State<WorkoutPlayer> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ItemScrollController _itemScrollController = ItemScrollController();

  List<Exercise> exercises = [];
  var curExerciseIndex = 0;

  @override
  void initState() {
    super.initState();
    // TODO: fetch workout and exercises here
    String dummyThumbnailUrl = "https://cdn.centr.com/content/17000/16775/images/landscapewidemobile3x-bobby-push-up-16-9.jpg";
    String dummyVideoUrl = "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4";
    exercises = [
      Exercise(1, "Exercise 1", "Exercise1 Description", dummyThumbnailUrl, "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4", 1),
      Exercise(2, "Exercise 2", "Exercise2 Description", dummyThumbnailUrl, dummyVideoUrl, 1),
      Exercise(3, "Exercise 3", "Exercise3 Description", dummyThumbnailUrl, dummyVideoUrl, 10),
      Exercise(4, "Exercise 4", "Exercise4 Description", dummyThumbnailUrl, dummyVideoUrl, 60),
      Exercise(5, "Exercise 5", "Exercise5 Description", dummyThumbnailUrl, dummyVideoUrl, 90),
      Exercise(6, "Exercise 6", "Exercise6 Description", dummyThumbnailUrl, dummyVideoUrl, 120),
      Exercise(7, "Exercise 7", "Exercise7 Description", dummyThumbnailUrl, dummyVideoUrl, 191),
      Exercise(8, "Exercise 8", "Exercise8 Description", dummyThumbnailUrl, dummyVideoUrl, 1000),
    ];
  }

  void setCurExercise(int index) {
    setState(() {
      curExerciseIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                videoPlayerFunction(context, exercises[curExerciseIndex].videoSrc),
                videoDescription(),
              ]
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.orange,
              child: Column(
                children: [
                  workoutTitle(),
                  Expanded(
                    child: exerciseList(context, exercises, setCurExercise, _itemScrollController),
                  )
                ],
              )
            )
          )
        ]
      ),
    );
    return scaffold;
  }
}

Widget videoPlayerFunction(BuildContext context, String videoSrcUrl)  {
  return Stack(
    children: <Widget> [
      Container(
        color: Colors.black,
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.75,
        child: AspectRatio(
          aspectRatio: 16/9, // TODO: should be the aspect ratio of the video
          child: VideoPlayer(videoSrcUrl, UniqueKey())
        ),
      ),
      countDownTimer(context)
    ]
  );
}

Widget countDownTimer(BuildContext context) {
  return Positioned(
    top: 0,
    left: MediaQuery.of(context).size.width / 30,
    child: CircularCountDownTimer(
      duration: 30,
      initialDuration: 0,
      width: MediaQuery.of(context).size.width / 30,
      height: 200,
      ringColor: Colors.grey,
      fillColor: Colors.white,
      strokeWidth: 3.0,
      strokeCap: StrokeCap.round,
      textStyle: const TextStyle(
        fontSize: 20.0,
        color: Colors.white,
        fontWeight: FontWeight.bold
      ),
      textFormat: CountdownTextFormat.S,
      isReverse: true,
      isTimerTextShown: true,
      autoStart: true,
    )
  );
}

Widget videoDescription() {
  return const Text('This is the workout description', textAlign: TextAlign.left,);
}

Widget workoutTitle() {
  return Container(
    alignment: Alignment.centerLeft,
    child: const Text(
      'Title of Workout',
      textAlign: TextAlign.left,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 30
      )
    )
  );
}

Widget exerciseList(BuildContext context, List<Exercise> exercises, Function setCurExercise, ItemScrollController _itemScrollController) {
  return exercises.isNotEmpty
    ? ScrollablePositionedList.builder(
        itemScrollController: _itemScrollController,
        itemCount: exercises.length,
        itemBuilder: (BuildContext context, int index) {
          var itemKey = GlobalKey();
          return GestureDetector(
            key: itemKey,
            child: exercise(context, exercises[index]),
            onTap: () => {
              setCurExercise(index),
              playExercise(itemKey, index, _itemScrollController),
            }
          );
        }
      )
      : Row(
        children: const [
          CircularProgressIndicator(),
          Text("Loading")
        ]
      );
}

Future playExercise(itemKey, index, _scrollController) async {
  await _scrollController.scrollTo(
    index: index,
    duration: Duration(milliseconds: 500),
    curve: Curves.easeInOutCubic
  );
}


Widget exercise(BuildContext context, Exercise exercise) {
  Duration duration = Duration(seconds: exercise.length);
  String sDuration = "${duration.inMinutes.toString().padLeft(2, "0")}:${duration.inSeconds.remainder(60).toString().padLeft(2, "0")}";
  return Row(
    // alignment: WrapAlignment.spaceAround,
    children: [
      Container(
        margin: const EdgeInsets.all(8.0),
        height: 120,
        width: MediaQuery.of(context).size.width / 6,
        child: Image.network(exercise.thumbnailSrc),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            exercise.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 15
            )
          ),
          Text(
            sDuration,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 10
            )
          ),
        ],
      )
    ],
  );
}
