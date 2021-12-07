import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'chewie_list_item.dart';

class WorkoutViewer extends StatefulWidget {
  const WorkoutViewer({Key? key}) : super(key: key);

  @override
  State<WorkoutViewer> createState() => _WorkoutViewer();
}

class _WorkoutViewer extends State<WorkoutViewer> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String workoutTitle = "Title";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) { 
    // TODO: Bottom Overflow (probable cause is video player) (WP-77)
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(35.0, 10.0, 0, 0),
              alignment: Alignment.centerLeft,
              child: Text(
                workoutTitle,
                style: const TextStyle(
                  fontFamily: "BalooBhai2",
                  fontSize: 32,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 50),
              child:  Divider(
                color: Colors.black,
                indent: 35,
                endIndent: 175,
                thickness: 0.5,
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(35.0, 75, 0, 0),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Preview",
                style: TextStyle(
                  fontFamily: "BalooBhai2",
                  fontSize: 28,
                  color: Colors.black,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ), 
          ],
        ),
        Container(
          color: Colors.white,
          alignment: Alignment.topCenter,
          // TODO: Fix width and height pixel overflows (WP-77)
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.4,
          // TODO: Update video to be the actual workout video (WP-82)
          child: AspectRatio(
            aspectRatio:
              16 / 9, 
            child: ChewieListItem(
              videoPlayerController: VideoPlayerController.network(
                'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'
              ), 
            ),
          ),
        ),
      ],
    );
  }
}
