import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:workoutpersonalizer_frontend/models/exercise.dart';
// import 'package:workoutpersonalizer_frontend/ui/workoutPlayer/models/Exercise2.dart';

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
    // TODO: change exercises here
    String dummyThumbnailUrl = "https://cdn.centr.com/content/17000/16775/images/landscapewidemobile3x-bobby-push-up-16-9.jpg";
    String dummyVideoUrl = "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4";
    List<String> tags =[];
    exercises = [
      Exercise(1, "Side to Side Stretch", "Stretch from side to side!", "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Clip+1+Thumbnail.png", "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Clip+1.mp4", 44, 
        DateTime.parse("2021-11-23 13:02:51.023-08"),
        DateTime.parse("2021-11-23 13:02:51.023-08"),
        []
      ),
      Exercise(2, "Arm Circles", "Circular arms!", "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Clip+2+Thumbnail.png", "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Clip+2.mp4", 30,
        DateTime.parse("2021-11-23 13:02:51.023-08"),
        DateTime.parse("2021-11-23 13:02:51.023-08"),
        []
      ),
      Exercise(3, "Neck Circles", "Rotational neck circles", "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Clip+3+Thumbnail.png", "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Clip+3+.mp4", 30,
        DateTime.parse("2021-11-23 13:02:51.023-08"),
        DateTime.parse("2021-11-23 13:02:51.023-08"),
        []
      ),
      /*
      Exercise(4, "Hip Flexor Right", "Stretch your right hip flexor!", "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Clip+4+Thumbnail.png", "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Clip+4+.mp4", 30),
      Exercise(5, "Ham String Stretch", "Let's stretch those hamstrings!", "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Clip+5+Thumbnail.png", "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Clip+5+.mp4", 30),
      Exercise(6, "Pigeon Stretch", "This is the pigeon stretch!", "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Clip+6+Thumbnail.png", "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Clip+6+.mp4", 30),
      Exercise(7, "Hip Flexor Left", "Stretch your left hip flexor!", "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Clip+7+Thumbnail.png", "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Clip+7+.mp4", 30),
      Exercise(8, "Tummy Stretch", "Stretch your tummy!", "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Clip+8+Thumbnail.png", "https://s3.console.aws.amazon.com/s3/object/teamworkoutplatform?region=us-west-2&prefix=Clip+8.mp4", 30),
      */
    ];
  }

  void setCurExercise(int index) {
    setState(() {
      curExerciseIndex = index;
    });
  }

  void playNextExercise() {
    if (curExerciseIndex + 1 < exercises.length) {
      this.setCurExercise(curExerciseIndex + 1);
    }
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
                videoPlayerFunction(context, exercises[curExerciseIndex].videoSrc, this.playNextExercise),
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
                    child: exerciseList(context, exercises, setCurExercise, _itemScrollController, curExerciseIndex),
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

Widget videoPlayerFunction(BuildContext context, String videoSrcUrl, Function handleVideoCompleted)  {
  return Stack(
    children: <Widget> [
      Container(
        color: Colors.black,
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.75,
        child: AspectRatio(
          aspectRatio: 16/9,
          child: VideoPlayer(videoSrcUrl, UniqueKey(), handleVideoCompleted)
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
  return const Text('This is the 5-minute stretch workout!', textAlign: TextAlign.left,);
}

Widget workoutTitle() {
  // TODO: get workout description/notes/memo from backend (WP-87)
  return Container(
    alignment: Alignment.centerLeft,
    child: const Text(
      '5 Minute Stetch',
      textAlign: TextAlign.left,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 30
      )
    )
  );
}

Widget exerciseList(BuildContext context, List<Exercise> exercises, Function setCurExercise, ItemScrollController _itemScrollController, curExerciseIndex) {
  // TODO: Fix overflow (WP-85)
  return exercises.isNotEmpty
    ? ScrollablePositionedList.builder(
        itemScrollController: _itemScrollController,
        itemCount: exercises.length,
        itemBuilder: (BuildContext context, int index) {
          var itemKey = GlobalKey();
          return GestureDetector(
            key: itemKey,
            child: exercise(context, exercises[index], curExerciseIndex == index),
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

Widget exercise(BuildContext context, Exercise exercise, bool isCurIndex) {
  Duration duration = Duration(seconds: exercise.length);
  String sDuration = "${duration.inMinutes.toString().padLeft(2, "0")}:${duration.inSeconds.remainder(60).toString().padLeft(2, "0")}";
  return Container(
    color: isCurIndex ? Colors.white : Colors.transparent,
    child: ExpandablePanel(
      header: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(8.0),
            height: 120,
            width: MediaQuery.of(context).size.width / 6,
            child: Image.network(exercise.thumbnailSrc),
          ),
          Flexible(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, // crossAxisAlignment: CrossAxisAlignment.start, align left
            children: [
              Text(
                exercise.name,
                textAlign: TextAlign.center, // textAlign: TextAlign.left, align left
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 15
                )
              ),
              Text(
                sDuration,
                // textAlign: TextAlign.left, align left
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 10
                )
              ),
            ],
          ),)
        ],
      ),
      collapsed: Container(),
      expanded: Text(exercise.description, softWrap: true),
      theme: const ExpandableThemeData(
        bodyAlignment: ExpandablePanelBodyAlignment.center,
        tapHeaderToExpand: false,
        tapBodyToExpand: true,
        tapBodyToCollapse: true,
      )
    )
  );
}
