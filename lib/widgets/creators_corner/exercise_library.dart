import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/constants/styles.dart';
import 'package:workoutpersonalizer_frontend/models/exercise.dart';
import 'package:workoutpersonalizer_frontend/models/pair.dart';
import 'package:workoutpersonalizer_frontend/widgets/exercise_card.dart';
import 'package:workoutpersonalizer_frontend/widgets/creators_corner/filter_list.dart';

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
    String dummyThumbnailUrl = "https://cdn.centr.com/content/17000/16775/images/landscapewidemobile3x-bobby-push-up-16-9.jpg";
    String dummyVideoUrl = "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4";
    allExercises = [
      Exercise(1, "Exercise 1", "Exercise1 Description", "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+1+Thumbnail.png", dummyVideoUrl, 1),
      Exercise(2, "Exercise 2", "Exercise2 Description", "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+2+Thumbnail.png", dummyVideoUrl, 1),
      Exercise(3, "Exercise 3", "Exercise3 Description", "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+3+Thumbnail.png", dummyVideoUrl, 10),
      Exercise(4, "Exercise 4", "Exercise4 Description", "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+4+Thumbnail.png", dummyVideoUrl, 60),
      Exercise(5, "Exercise 5", "Exercise5 Description", "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+5+Thumbnail+.png", dummyVideoUrl, 90),
      Exercise(6, "Exercise 6", "Exercise6 Description", "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+6+Thumbnail.png", dummyVideoUrl, 120),
      Exercise(7, "Exercise 7", "Exercise7 Description", "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+7+Thumbnail.png", dummyVideoUrl, 191),
      Exercise(8, "Exercise 8", "Exercise8 Description", "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+8+Thumbnail.png", dummyVideoUrl, 1000),
      Exercise(9, "Exercise 9", "Exercise9 Description", "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+9+Thumbnail.png", dummyVideoUrl, 191),
      Exercise(10, "Exercise 10", "Exercise10 Description", "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+10+Thumbnail.png", dummyVideoUrl, 1000),
      Exercise(11, "Exercise 11", "Exercise11 Description", "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+11+Thumbnail.png", dummyVideoUrl, 1000),
      Exercise(12, "Exercise 12", "Exercise12 Description", "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+12+Thumbnail.png", dummyVideoUrl, 1000),
      Exercise(12, "Exercise 13", "Exercise13 Description", "https://teamworkoutplatform.s3.us-west-2.amazonaws.com/Exercise+13+Thumbnail+.png", dummyVideoUrl, 1000),
    ];
    savedExercises = [
      Exercise(1, "Exercise 1", "Exercise1 Description", dummyThumbnailUrl, dummyVideoUrl, 1),
      Exercise(2, "Exercise 2", "Exercise2 Description", dummyThumbnailUrl, dummyVideoUrl, 1),
      Exercise(3, "Exercise 3", "Exercise3 Description", dummyThumbnailUrl, dummyVideoUrl, 10),
    ];
    allExercisesTagList = ["abs", "chest", "back", "legs", "arms", "abs", "legs", "chest", "chest", "legs", "abs", "abs", "abs"];
    savedExercisesTagList = ["abs", "chest", "back"];
  }

  Widget buildGrid(BuildContext context, int cardsInRow, double leftPadding) {
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
          List<String> tagList;
          if (allPressed) {
            tagList = allExercisesTagList;
          } else {
            tagList = savedExercisesTagList;
          }

          return Draggable<Pair<Exercise, String>>(
            data: Pair(exercises[index], tagList[index]),
            hitTestBehavior: HitTestBehavior.translucent,
            feedback: createExerciseCardDraggable(exercises, index, tagList),
            child: createExerciseCard(exercises, index, tagList),
          );
        }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget sideBarOpenedWidget = Expanded(
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
          Expanded(
            flex: 6,
            child: Scaffold(body: buildGrid(context, 3, 50.0))
          ),
        ],
      ),
    );

    Widget sideBarClosedWidget = Expanded(
      child: Scaffold(body: buildGrid(context, 4, 10)),
    );

    Widget widgetToAdd = sideBarOpened? sideBarOpenedWidget : sideBarClosedWidget;

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
              }
            ),
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
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                    overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                  ),
                  child: Text(
                    "All",
                    style: allPressed ? exerciseLibraryPressedStyle : exerciseLibraryNotPressedStyle,
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
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                    overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                  ),
                  child: Text(
                    "Saved",
                    style: savedPressed ? exerciseLibraryPressedStyle : exerciseLibraryNotPressedStyle,
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
