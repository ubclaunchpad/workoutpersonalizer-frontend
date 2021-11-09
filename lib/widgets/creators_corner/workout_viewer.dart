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

  @override
  void initState() {
    super.initState();
    // TODO: fetch exercises here
    String dummyThumbnailUrl =
        "https://www.inposture.com/wp-content/uploads/2020/05/Sit-ups.jpg";
    String dummyVideoUrl =
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        color: Colors.black,
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.75,
        child: AspectRatio(
            aspectRatio:
                16 / 9, // TODO: should be the aspect ratio of the video
            child: ChewieListItem(
                videoPlayerController: VideoPlayerController.network(
                    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'))),
      ),
    ]);
  }
}
