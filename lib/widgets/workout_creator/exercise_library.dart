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
  late Future<List<Exercise>> allExercises;
  late Future<List<Exercise>> savedExercises;
  List<String> allExercisesTagList = [];
  List<String> savedExercisesTagList = [];

  bool allPressed = true;
  bool savedPressed = false;

  bool sideBarOpened = false;

  @override
  void initState() {
    super.initState();
    allExercises = fetchAllExercises();
    savedExercises = fetchSavedExercises();
  }

  Widget buildGrid(BuildContext context, int cardsInRow, double leftPadding) {
    // TODO: Scale the number of cards in the row (WP-79)
    Future<List<Exercise>> exercises;
    if (allPressed) {
      exercises = allExercises;
    } else {
      exercises = savedExercises;
    }

    return Container(
        color: Colors.white,
        child: FutureBuilder<List<Exercise>>(
            future: exercises,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: cardsInRow,
                        childAspectRatio: 1.1,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20),
                    padding: EdgeInsets.fromLTRB(leftPadding, 5.0, 50.0, 5.0),
                    itemCount: (snapshot.data ?? []).length,
                    itemBuilder: (BuildContext context, int index) {
                      return Draggable<Exercise>(
                        data: (snapshot.data ?? [])[index],
                        hitTestBehavior: HitTestBehavior.translucent,
                        feedback: createExerciseCardDraggable(
                            snapshot.data ?? [], index),
                        child: createExerciseCard(
                            snapshot.data ?? [], index, allPressed, false),
                      );
                    });
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else {
                return const CircularProgressIndicator();
              }
            }));
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
