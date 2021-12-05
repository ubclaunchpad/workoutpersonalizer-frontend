import 'package:flutter/material.dart';
import 'package:workoutpersonalizer_frontend/constants/styles.dart';
import 'package:workoutpersonalizer_frontend/models/exercise.dart';

Widget createExerciseCard(List<Exercise> exercises, int index, List<String> tagList) {
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
              top: -10,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    print("pressed heart\n");
                  },
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  icon: const Icon(
                    Icons.favorite_outline,
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
              '#' + tagList[index],
              style: exerciseCardTagStyle,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget createExerciseCardEditor(List<Exercise> exercises, int index, List<String> tagList) {
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
              '#' + tagList[index],
              style: exerciseCardTagStyle,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget createExerciseCardDraggable(List<Exercise> exercises, int index, List<String> tagList) {
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
                  '#' + tagList[index],
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