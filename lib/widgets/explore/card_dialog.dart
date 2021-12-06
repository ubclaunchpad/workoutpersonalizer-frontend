import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/models/exercise.dart';
import 'package:workoutpersonalizer_frontend/constants/styles.dart';
import 'package:workoutpersonalizer_frontend/widgets/exercise_card.dart';

class ExerciseDialog extends StatelessWidget {
  ExerciseDialog(this.exercise);
  final Exercise exercise;

  void addToWorkouts(value) {
    print("this is value " + value);
  }

  @override
  Widget build(BuildContext context) {
    //TODO: Fix styling of dialog (WP-75)
    return Dialog(
      child: Container(
          height: 600,
          width: 800,
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            // child: Column()
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ListTile(
                  title: Text(exercise.name, style: exerciseDialogTitleStyle),
                  trailing: PopupMenuButton(
                    onSelected: (value) {
                      addToWorkouts(value);
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        child: Text("First"),
                        value: "first",
                      ),
                      const PopupMenuItem(
                        child: Text("Second"),
                        value: "second",
                      )
                    ],
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: Colors.cyan,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 3.0),
                        child: const Text('ADD',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Color(0xFF000000))),
                      ),
                    ),
                  ),
                ),
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    exercise.thumbnailSrc,
                    fit: BoxFit.cover,
                  ),
                ),
                const Padding(
                    padding:
                        EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child:
                            Text('Description', style: secondaryHeadingStyle))),
                Padding(
                    padding: const EdgeInsets.only(top: 0, left: 8, right: 8),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(exercise.description,
                            style: exerciseDialogDescriptionContentStyle))),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(tagsString(exercise.tags),
                                style: exerciseDialogTagsStyle))))
              ],
            ),
          )),
    );
  }
}
