import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/constants/styles.dart';
import 'package:workoutpersonalizer_frontend/models/exercise.dart';
import 'package:workoutpersonalizer_frontend/widgets/exercise_card.dart';
import 'package:workoutpersonalizer_frontend/widgets/workout_creator/filter_list.dart';

class ExerciseLibrary extends StatefulWidget {
  @override
  ExerciseLibraryState createState() => ExerciseLibraryState();
}

class ExerciseLibraryState extends State<ExerciseLibrary> {
  List<Exercise> allExercises = [];
  List<Exercise> savedExercises = [];
  List<String> allExercisesTagList = [];
  List<String> savedExercisesTagList = [];

  bool allPressed = true;
  bool savedPressed = false;

  bool sideBarOpened = false;

  @override
  void initState() {
    super.initState();
    allExercises = [
      Exercise(
          1,
          "Side to Side Stretch",
          "Stretch from side to side!",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Clip+1+Thumbnail.png",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Clip+1.mp4",
          30,
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          ['obliques']),
      Exercise(
          2,
          "Arm Circles",
          "Circular arms!",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Clip+2+Thumbnail.png",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Clip+2.mp4",
          30,
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          ['arms']),
      Exercise(
          3,
          "Neck Circles",
          "Rotational neck circles",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Clip+3+Thumbnail.png",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Clip+3.mp4",
          30,
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          ['neck']),
      Exercise(
          4,
          "Hip Flexor Right",
          "Stretch your right hip flexor!",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Clip+4+Thumbnail.png",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Clip+4.mp4",
          30,
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          ['legs']),
      Exercise(
          5,
          "Ham String Stretch",
          "Let's stretch those hamstrings!",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Clip+5+Thumbnail.png",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Clip+5.mp4",
          30,
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          ['legs']),
      Exercise(
          6,
          "Pigeon Stretch",
          "This is the pigeon stretch!",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Clip+6+Thumbnail.png",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Clip+6.mp4",
          30,
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          ['legs', 'back']),
      Exercise(
          7,
          "Hip Flexor Left",
          "Stretch your left hip flexor!",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Clip+7+Thumbnail.png",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Clip+7.mp4",
          30,
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          ['legs']),
      Exercise(
          8,
          "Tummy Stretch",
          "Stretch your tummy!",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Clip+8+Thumbnail.png",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Clip+8.mp4",
          30,
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          ['chest', 'back', 'abs']),
      Exercise(
          9,
          "Crunch",
          "desc9",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+1+Thumbnail.png",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+1+.mp4",
          30,
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          ['abs']),
      Exercise(
          10,
          "Hold + Single Taps",
          "desc10",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+13+Thumbnail+.png",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+13+.mp4",
          30,
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          ['abs']),
      Exercise(
          11,
          "Flutter Kicks",
          "desc11",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+2+Thumbnail.png",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+2+.mp4",
          30,
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          ['abs']),
      Exercise(
          12,
          "Scissor Kicks",
          "desc12",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+3+Thumbnail.png",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+3+.mp4",
          30,
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          ['abs']),
      Exercise(
          13,
          "Ab Hold",
          "desc13",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+4+Thumbnail.png",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+4+.mp4",
          30,
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          ['abs']),
      Exercise(
          14,
          "1 Arm 1 Leg Reach Out",
          "desc14",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+6+Thumbnail.png",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+6+.mp4",
          30,
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          ['abs']),
      Exercise(
          15,
          "Plank + Crunch Left",
          "desc15",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+7+Thumbnail.png",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+7+.mp4",
          30,
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          ['abs']),
      Exercise(
          16,
          "Plank + Crunch Right",
          "desc16",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+13+Thumbnail+.png",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+13+.mp4",
          30,
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          ['abs']),
      Exercise(
          17,
          "Plank + 3 Elbow Taps",
          "desc17",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+8+Thumbnail.png",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+8+.mp4",
          30,
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          ['abs']),
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
    savedExercises = [
      Exercise(
          14,
          "1 Arm 1 Leg Reach Out",
          "desc14",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+6+Thumbnail.png",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+6+.mp4",
          30,
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          ['abs']),
      Exercise(
          16,
          "Plank + Crunch Right",
          "desc16",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+13+Thumbnail.png",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+13+.mp4",
          30,
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          ['abs']),
      Exercise(
          6,
          "Pigeon Stretch",
          "This is the pigeon stretch!",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Clip+6+Thumbnail.png",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Clip+6.mp4",
          30,
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          ['legs', 'back']),
      Exercise(
          24,
          "Plank Jump",
          "desc24",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+13+Thumbnail.png",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+13+.mp4",
          30,
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          ['abs']),
      Exercise(
          22,
          "Lean Back + Russian Twist",
          "desc22",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+13+Thumbnail.png",
          "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+13+.mp4",
          30,
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          DateTime.parse("2021-11-23 13:02:51.023-08"),
          ['abs']),
    ];
  }

  Widget buildGrid(BuildContext context, int cardsInRow, double leftPadding) {
    // TODO: Scale the number of cards in the row (WP-79)
    List<Exercise> exercises;
    if (allPressed) {
      exercises = allExercises;
    } else {
      exercises = savedExercises;
    }

    return Container(
      color: Colors.white,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: cardsInRow,
              childAspectRatio: 1.1,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          padding: EdgeInsets.fromLTRB(leftPadding, 5.0, 50.0, 5.0),
          itemCount: exercises.length,
          itemBuilder: (BuildContext context, int index) {
            return Draggable<Exercise>(
              data: exercises[index],
              hitTestBehavior: HitTestBehavior.translucent,
              feedback: createExerciseCardDraggable(exercises, index),
              child: createExerciseCard(exercises, index, allPressed, false),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget sideBarOpenedWidget = Expanded(
      // TODO: Pixel overflow caused from text and button not scaling (WP-78)
      child: Row(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.1,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      filled: true,
                      fillColor: Color(0xFFE5E5E5),
                      isDense: true,
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                const FilterList(),
              ],
            ),
          ),
          const VerticalDivider(
            color: Color(0xF0DADADA),
            thickness: 2,
          ),
          Expanded(flex: 6, child: Scaffold(body: buildGrid(context, 3, 50.0))),
        ],
      ),
    );

    Widget sideBarClosedWidget = Expanded(
      child: Scaffold(body: buildGrid(context, 4, 10)),
    );

    Widget widgetToAdd =
        sideBarOpened ? sideBarOpenedWidget : sideBarClosedWidget;

    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            IconButton(
                padding: const EdgeInsets.fromLTRB(8, 5, 0, 0),
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                icon: const Icon(Icons.dehaze_rounded),
                onPressed: () => {
                      setState(() {
                        sideBarOpened = !sideBarOpened;
                      })
                    }),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 2.0),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      allPressed = true;
                      savedPressed = false;
                    });
                  },
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                    overlayColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                  ),
                  child: Text(
                    "All",
                    style: allPressed
                        ? exerciseLibraryPressedStyle
                        : exerciseLibraryNotPressedStyle,
                  ),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 2.0),
                child: Text(
                  '|',
                  style: exerciseLibraryNotPressedStyle,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 2.0),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      allPressed = false;
                      savedPressed = true;
                    });
                  },
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                    overlayColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                  ),
                  child: Text(
                    "Saved",
                    style: savedPressed
                        ? exerciseLibraryPressedStyle
                        : exerciseLibraryNotPressedStyle,
                  ),
                ),
              ),
            ),
            const Spacer(),
            OutlinedButton(
              onPressed: () {
                //TODO: implement adding break feature (WP-37)
                print('Received Click');
              },
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                backgroundColor: const Color(0xFF3CBFD4),
              ),
              child: const Text(
                'Add Break',
                style: addButtonStyle,
              ),
            ),
            const Padding(padding: EdgeInsets.fromLTRB(50.0, 30.0, 5.0, 30.0)),
          ],
        ),
        widgetToAdd,
      ],
    );
  }
}
