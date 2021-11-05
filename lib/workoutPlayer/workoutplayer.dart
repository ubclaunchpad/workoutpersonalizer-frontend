import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

import 'chewie_list_item.dart';

// void workoutplayer() {
//   runApp(
//     MaterialApp(
//       home: WorkoutPlayer(),
//     ),
//   );
// }

/// This is the stateful widget that the main application instantiates.
class WorkoutPlayer extends StatefulWidget {
  const WorkoutPlayer({Key? key}) : super(key: key);

  @override
  State<WorkoutPlayer> createState() => _WorkoutPlayer();
}

/// This is the private State class that goes with MyStatefulWidget.
class _WorkoutPlayer extends State<WorkoutPlayer> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      key: _scaffoldKey,
      appBar: theAppBar(),
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                videoPlayerFunction(context),
                videoDescription(),
              ]
            ),
          ),
          Positioned(
            right: 0,
            child: workoutList(context)
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
          aspectRatio: 16/9, // should be aspect ratio of the video
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
  return Text('This is the Workout:', textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30) );
}

Widget workoutList(BuildContext context) { 
  return Container(
    decoration: BoxDecoration(color: Colors.blueGrey),
    child: SingleChildScrollView(
      child: Row(
        children: [
          Column(
            children: [
              workoutTitle(),
              SizedBox(height: 10),
              workout(context, 'Workout 1'),
              SizedBox(height: 10),
              workout(context, 'Workout 2'),
              SizedBox(height: 10),
              workout(context, 'Workout 3'),
              SizedBox(height: 10),
              workout(context, 'Workout 4'),
              SizedBox(height: 10),
              workout(context, 'Workout 5'),
              SizedBox(height: 10),
              workout(context, 'Workout 6'),             
              SizedBox(height: 10),
              workout(context, 'Workout 7'),
            ]
          )
        ],
      )
    )
  );
}


Widget workout(BuildContext context, String numberOfWorkOut) { 
  return Row(
    children: [
      Column(
        children: [
          Container( 
          height: 100, 
          width: MediaQuery.of(context).size.width / 6,
          decoration: BoxDecoration(color: Colors.grey),
        )]
      ),
      Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Text(
            numberOfWorkOut, 
            style: TextStyle(
              fontWeight: FontWeight.bold, 
              color: Colors.white, 
              fontSize: 15)
            ),
          Text(
            '0:00-2:00', 
            style: TextStyle(
              fontWeight: FontWeight.bold, 
              color: Colors.white, 
              fontSize: 10)
          ),
        ],
      )
    ],
  );
}