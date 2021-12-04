import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/constants/styles.dart';
import 'package:workoutpersonalizer_frontend/models/exercise.dart';

class ExerciseLibrary extends StatefulWidget {
  @override
  ExerciseLibraryState createState() => ExerciseLibraryState();
}

class ExerciseLibraryState extends State<ExerciseLibrary> {
  List<Exercise> allExercises = [];
  List<Exercise> savedExercises = [];

  bool allPressed = true;
  bool savedPressed = false;

  @override
  void initState() {
    super.initState();
    String dummyThumbnailUrl = "https://cdn.centr.com/content/17000/16775/images/landscapewidemobile3x-bobby-push-up-16-9.jpg";
    String dummyVideoUrl = "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4";
    allExercises = [
      Exercise(1, "Exercise 1", "Exercise1 Description", dummyThumbnailUrl, dummyVideoUrl, 1),
      Exercise(2, "Exercise 2", "Exercise2 Description", dummyThumbnailUrl, dummyVideoUrl, 1),
      Exercise(3, "Exercise 3", "Exercise3 Description", dummyThumbnailUrl, dummyVideoUrl, 10),
      Exercise(4, "Exercise 4", "Exercise4 Description", dummyThumbnailUrl, dummyVideoUrl, 60),
      Exercise(5, "Exercise 5", "Exercise5 Description", dummyThumbnailUrl, dummyVideoUrl, 90),
      Exercise(6, "Exercise 6", "Exercise6 Description", dummyThumbnailUrl, dummyVideoUrl, 120),
      Exercise(7, "Exercise 7", "Exercise7 Description", dummyThumbnailUrl, dummyVideoUrl, 191),
      Exercise(8, "Exercise 8", "Exercise8 Description", dummyThumbnailUrl, dummyVideoUrl, 1000),
    ];
    savedExercises = [
      Exercise(1, "Exercise 1", "Exercise1 Description", dummyThumbnailUrl, dummyVideoUrl, 1),
      Exercise(2, "Exercise 2", "Exercise2 Description", dummyThumbnailUrl, dummyVideoUrl, 1),
      Exercise(3, "Exercise 3", "Exercise3 Description", dummyThumbnailUrl, dummyVideoUrl, 10),
    ];
  }

  Widget buildGrid(BuildContext context) {
    List<Exercise> exercises;
    if (allPressed) {
      exercises = allExercises;
    } else {
      exercises = savedExercises;
    }
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        padding: const EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
        itemCount: exercises.length,
        itemBuilder: (BuildContext context, int index) {
          return Draggable<Exercise>(
            data: exercises[index],
            hitTestBehavior: HitTestBehavior.translucent,
            feedback: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(1.1, 1.1),
                    blurRadius: 10.0,
                  ),
                ],
                color: Colors.white,
                border: Border.all(width: 5),
                shape: BoxShape.rectangle,
              ),
              child: Column(
                children: <Widget>[
                  const Padding(padding: EdgeInsets.all(15)),
                  Text(
                    exercises[index].name,
                    style: draggableBoxStyle,
                  ),
                  const Padding(padding: EdgeInsets.all(5)),
                  const Text(
                    'muscle group',
                    style: draggableBoxStyle,
                  ),
                  const Padding(padding: EdgeInsets.all(15)),
                ],
              ),
            ),
            child: Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(exercises[index].name),
                    subtitle: Text('muscle group',
                        style: TextStyle(color: Colors.black.withOpacity(0.6))),
                  ),
                  Text(
                    exercises[index].description,
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            const Padding(padding: EdgeInsets.fromLTRB(50.0, 30.0, 5.0, 30.0)),
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
                  child: Text(
                    "All",
                    style: allPressed ? const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black) :
                        const TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 2.0),
                child: Text('|',
                    style: TextStyle(
                      fontSize: 25,
                    )),
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
                  child: Text(
                    "Saved",
                    style: savedPressed ? const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black) :
                        const TextStyle(fontSize: 25, color: Colors.black),
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
              child: const Text(
                'Add Break',
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
            ),
            const Padding(padding: EdgeInsets.fromLTRB(50.0, 30.0, 5.0, 30.0)),
          ],
        ),
        Expanded(
          child: Scaffold(body: buildGrid(context)),
        ),
      ],
    );
  }
}
