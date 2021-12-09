import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/models/exercise.dart';
import 'package:workoutpersonalizer_frontend/constants/styles.dart';
import 'package:workoutpersonalizer_frontend/widgets/exercise_card.dart';

class ExerciseDialog extends StatelessWidget {
  ExerciseDialog(this.exercise);
  final Exercise exercise;

  void addToWorkouts(value) {
    //TODO: find better spot for this function (https://ubclaunchpad.atlassian.net/browse/WP-90)
    print("this is value " + value);
  }

  @override
  Widget build(BuildContext context) {
    //TODO: Fix styling of dialog (https://ubclaunchpad.atlassian.net/browse/WP-75)
    return Dialog(
      child: Container(
          height: 600,
          width: 800,
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              // TODO: match the popupmenu button to the figma design (https://ubclaunchpad.atlassian.net/browse/WP-83)
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ListTile(
                  title: Text(exercise.name, style: exerciseDialogTitleStyle),
                  // TODO: extract popupmenu button for re-use (https://ubclaunchpad.atlassian.net/browse/WP-89)
                  trailing: PopupMenuButton<String>(
                    color: const Color(0xFF76B5BF),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    onSelected: (value) {
                      addToWorkouts(value);
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        padding: EdgeInsets.only(right: 0, left: 10),
                        child: Text("8 Minutes to Intense Abs",
                            style: addExercisePopupMenuItemTextStyle),
                        value: "first",
                      ),
                      const PopupMenuItem(
                        padding: EdgeInsets.only(right: 0, left: 10),
                        child: Text("4 Minute Stretch",
                            style: addExercisePopupMenuItemTextStyle),
                        value: "second",
                      ),
                      const PopupMenuDivider(),
                      const PopupMenuItem(
                          padding: EdgeInsets.only(right: 0, left: 10),
                          child: Text("New Workout",
                              style: addExercisePopupMenuItemTextStyle),
                          value: "new")
                    ],
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 3,
                          color: const Color(0xFF3CBFD4),
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 0.0),
                        child: const Text(' ADD ',
                            textAlign: TextAlign.center,
                            style: addExercisePopupMenuButtonTextStyle),
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
                            //TODO: take this function definition out of exercise_card (https://ubclaunchpad.atlassian.net/browse/WP-91)
                            child: Text(tagsString(exercise.tags),
                                style: exerciseDialogTagsStyle))))
              ],
            ),
          )),
    );
  }
}
