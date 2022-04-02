import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workoutpersonalizer_frontend/constants/styles.dart';
import 'package:workoutpersonalizer_frontend/models/exercise.dart';

class ExerciseCard extends StatelessWidget {
  final Exercise exercise;
  const ExerciseCard({Key? key, required this.exercise}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
                title: Text(
                  exercise.name,
                  style: primaryHeadingStyle,
                ),
                subtitle: Text(
                  exercise.length.toString() + " sec",
                  style: secondaryHeadingStyle,
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {},
                )),
            InkWell(
              onTap: () {},
              child: Image.network(exercise.thumbnailSrc, height: 225, fit: BoxFit.fitWidth)
            ),
            ListTile(
              minVerticalPadding: 20,
              subtitle: Text(
                "Last edited: "
                + DateFormat.yMd().format(exercise.updatedAt),
                style: secondaryHeadingStyle,
              ),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {},
              )
            ),
          ]
        ),
      ),
    );
  }
}