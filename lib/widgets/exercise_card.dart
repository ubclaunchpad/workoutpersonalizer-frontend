import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/constants/styles.dart';
import 'package:workoutpersonalizer_frontend/models/exercise.dart';

String tagsString(List<String> tags) {
  String output = "";
  for (int i = 0; i < tags.length; i++) {
    output = output + "#" + tags[i] + "  ";
  }
  return output;
}

Widget createExerciseCard(List<Exercise> exercises, int index,
    bool allExercisesButtonPressed, bool explorePage) {
  Icon heart;
  if (allExercisesButtonPressed) {
    heart = const Icon(
      Icons.favorite_outline,
      color: Colors.white,
    );
  } else {
    heart = const Icon(
      Icons.favorite,
      color: Color(0xFFEF3636),
    );
  }

  return Card(
    semanticContainer: true,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    color: const Color(0xFFF3EDED),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        ListTile(
          title: Text(
            exercises[index].name,
            style: exerciseCardTitleStyle,
          ),
          tileColor: orange,
          dense: true,
        ),
        Stack(alignment: Alignment.bottomLeft, children: <Widget>[
          AspectRatio(
            aspectRatio: 1.9,
            child: Image.network(
              exercises[index].thumbnailSrc,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              top: 0,
              right: -5,
              child: Column(
                children: [
                  explorePage
                      ? Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, right: 12.0, left: 8.0),
                          child: PopupMenuButton<String>(
                            color: lightTurqoise,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            onSelected: (value) {
                              print("add to " + value);
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
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black54,
                                    blurRadius: 8.0,
                                    spreadRadius: 0.1,
                                    offset: Offset(
                                      0.0,
                                      3.0,
                                    ),
                                  )
                                ],
                                color: Colors.white,
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
                        )
                      : const SizedBox.shrink(),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0.0, right: 8.0, left: 8.0, bottom: 8.0),
                    child: IconButton(
                        onPressed: () {},
                        iconSize: 35,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        icon: heart),
                  )
                ],
              )),
        ]),
        Padding(
          padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              tagsString(exercises[index].tags),
              style: exerciseCardTagStyle,
            ),
          ),
        )
      ],
    ),
  );
}

Widget createExerciseCardEditor(List<Exercise> exercises, int index) {
  return Card(
    semanticContainer: true,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    color: const Color(0xFFF3EDED),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        ListTile(
          title: Text(
            exercises[index].name,
            style: exerciseCardTitleStyle,
          ),
          tileColor: const Color(0xFFFFCD78),
          dense: true,
        ),
        Stack(
          alignment: Alignment.bottomLeft,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.9,
              child: Image.network(
                exercises[index].thumbnailSrc,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: -5,
              right: -5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    print("pressed trash\n");
                  },
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  icon: const Icon(
                    Icons.delete_outline,
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              tagsString(exercises[index].tags),
              style: exerciseCardTagStyle,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget createExerciseCardDraggable(List<Exercise> exercises, int index) {
  return Material(
    child: Container(
      width: 240,
      height: 202.4,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ListTile(
            title: Text(
              exercises[index].name,
              style: exerciseCardTitleStyle,
            ),
            tileColor: const Color(0xFFFFCD78),
            dense: true,
          ),
          AspectRatio(
            aspectRatio: 1.9,
            child: Image.network(
              exercises[index].thumbnailSrc,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: const Color(0xFFF3EDED),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  tagsString(exercises[index].tags),
                  style: exerciseCardTagStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
