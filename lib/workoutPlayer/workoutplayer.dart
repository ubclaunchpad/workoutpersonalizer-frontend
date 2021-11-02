import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:workoutpersonalizer_frontend/lib/workoutPlayer/chewie_list_item.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

void workoutplayer() {
  runApp(
    MaterialApp(
      home: _App(),
    ),
  );
}

class _App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: theAppBar(),
      body: 
      Container(
        child: Row(
          children: [
            Column(
              children: [
                videoPlayerFunction(context),
                videoDescription()],
            ),
            Column(
              children: [
                listOfWorkouts(context),
              ],
            )
          ]
        )
      )
    );
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
        actions: [ClipOval(child: Material(color: Colors.blue, child: InkWell(splashColor: Colors.red, onTap: () {}, 
            child: SizedBox(width: 56, height: 56, ))))],
      );
}

Widget videoPlayerFunction(BuildContext context)  {
  return Stack(
    children: <Widget> [
      Container(
        width: MediaQuery.of(context).size.width / 2,
        height: 600,
        child: Align( alignment: Alignment.topRight, 
        child:ChewieListItem(videoPlayerController: VideoPlayerController.network('http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4')),
        )),
        countDownTimer(context)]
  );
}

Widget countDownTimer(BuildContext context) { 
  return Container(child: CircularCountDownTimer(
            duration: 30,
            initialDuration: 0,
            width: MediaQuery.of(context).size.width / 30,
            height: 200,
            ringColor: Colors.grey,
            fillColor: Colors.black,
            strokeWidth: 3.0,
            strokeCap: StrokeCap.round,
            textStyle: TextStyle(
            fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold),
            textFormat: CountdownTextFormat.S,
            isReverse: true,
            isReverseAnimation: true,
            isTimerTextShown: true,
            autoStart: true,
            ));
}

Widget videoDescription() { 
  return Text('This is the workout description', textAlign: TextAlign.left,);
}

Widget workoutTitle() { 
  return Text('This is the Workout:', textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30) );
}

Widget listOfWorkouts(BuildContext context) { 
  return Container(
        height: 600,
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(color: Colors.blueGrey),
        child: 
        Row (children: [
        Column(
          children: [
            workoutTitle(),
            SizedBox(height: 10),
            workoutList(context, 'Workout 1'),
            SizedBox(height: 10),
            workoutList(context, 'Workout 2'),
            SizedBox(height: 10),
            workoutList(context, 'Workout 3'),
            SizedBox(height: 10),
            workoutList(context, 'Workout 4'),
            SizedBox(height: 10),
            workoutList(context, 'Workout 5')
          ]
        )
        ],)
        );
}


Widget workoutList(BuildContext context, String numberOfWorkOut) { 
  return Row(
    children: [
      Column(
        children: [
          Container( 
          height: 100, 
          width: MediaQuery.of(context).size.width / 4,
          decoration: BoxDecoration(color: Colors.grey),
        )]
      ),

      Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Text(numberOfWorkOut, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15)),
          Text('0:00-2:00', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 10)),
        ],
      )
    ],

  );
}