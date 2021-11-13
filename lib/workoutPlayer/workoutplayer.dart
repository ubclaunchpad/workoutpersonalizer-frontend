import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:workoutpersonalizer_frontend/models/Exercise.dart';

import 'chewie_list_item.dart';

/// This is the stateful widget that the main application instantiates.
class WorkoutPlayer extends StatefulWidget {
  const WorkoutPlayer({Key? key}) : super(key: key);

  @override
  State<WorkoutPlayer> createState() => _WorkoutPlayer();
}

/// This is the private State class that goes with MyStatefulWidget.
class _WorkoutPlayer extends State<WorkoutPlayer> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Exercise> exercises = [];

  @override
  void initState() {
    super.initState();
    // TODO: fetch exercises here
    String dummyThumbnailUrl = "https://www.inposture.com/wp-content/uploads/2020/05/Sit-ups.jpg";
    String dummyVideoUrl = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";
    exercises = [
      Exercise(1, "Exercise 1", "Exercise1 Description", dummyThumbnailUrl, dummyVideoUrl, 1),
      Exercise(2, "Exercise 2", "Exercise2 Description", dummyThumbnailUrl, dummyVideoUrl, 1),
      Exercise(3, "Exercise 3", "Exercise3 Description", dummyThumbnailUrl, dummyVideoUrl, 10),
      Exercise(4, "Exercise 4", "Exercise4 Description", dummyThumbnailUrl, dummyVideoUrl, 60),
      Exercise(5, "Exercise 5", "Exercise5 Description", dummyThumbnailUrl, dummyVideoUrl, 90),
      Exercise(6, "Exercise 6", "Exercise6 Description", dummyThumbnailUrl, dummyVideoUrl, 120),
      Exercise(7, "Exercise 7", "Exercise7 Description", dummyThumbnailUrl, dummyVideoUrl, 191),
      Exercise(8, "Exercise 8", "Exercise8 Description", dummyThumbnailUrl, dummyVideoUrl, 1000),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      key: _scaffoldKey,
      appBar: theAppBar(),
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                videoPlayerFunction(context),
                videoDescription(),
              ]
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey[300],
              child: Column(
                children: [
                  workoutTitle(),
                  Expanded(
                    child: workoutList(context, exercises),
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

theAppBar() { 
  return AppBar(
    backgroundColor: Colors.grey,
        title: Row(
          children: <Widget>[
            Text('WorkoutApp'), 
            OutlinedButton(onPressed: () {}, child: const Text('DashBoard', style: TextStyle(color: Colors.white))),
            OutlinedButton(onPressed: () {}, child: const Text('My Workouts', style: TextStyle(color: Colors.white))),
          ]
        ),
        actions: [
          ClipOval(
            child: Material(
              color: Colors.blue, 
              child: InkWell(
                splashColor: Colors.red, 
                onTap: () {}, 
                child: SizedBox(
                  width: 56, 
                  height: 56
                )
              )
            )
          )
        ],
      );
}

Widget videoPlayerFunction(BuildContext context)  {
  return Stack(
    children: <Widget> [
      Container(
        color: Colors.black,
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.75,
        child: AspectRatio(
          aspectRatio: 16/9, // TODO: should be the aspect ratio of the video
          child: ChewieListItem(
            videoPlayerController: VideoPlayerController.network('http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4')
          )
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
      textStyle: TextStyle(
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
  return Text('This is the workout description', textAlign: TextAlign.left,);
}

Widget workoutTitle() { 
  return Text(
    'Workout Title', 
    textAlign: TextAlign.left, 
    style: TextStyle(
      fontWeight: FontWeight.bold, 
      color: Colors.black, 
      fontSize: 30
    ) 
  );
}

Widget workoutList(BuildContext context, List<Exercise> exercises) { 
  return exercises.isNotEmpty
    ? ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (BuildContext context, int index) {
          return workout(context, exercises[index]);
        }
      )
      : Row(
        children: const [
          CircularProgressIndicator(),
          Text("Loading")
        ] 
      );
}


Widget workout(BuildContext context, Exercise exercise) { 
  Duration duration = Duration(seconds: exercise.length);
  String sDuration = "${duration.inMinutes.toString().padLeft(2, "0")}:${duration.inSeconds.remainder(60).toString().padLeft(2, "0")}";
  return Row(
    // alignment: WrapAlignment.spaceAround,
    children: [
      Container( 
        margin: EdgeInsets.all(8.0),
        height: 100, 
        width: MediaQuery.of(context).size.width / 6,
        child: Image.network(exercise.thumbnailSrc),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            exercise.name, 
            style: TextStyle(
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