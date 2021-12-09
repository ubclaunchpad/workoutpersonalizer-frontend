import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workoutpersonalizer_frontend/constants/styles.dart';
import 'package:workoutpersonalizer_frontend/models/workout.dart';

class WorkoutCard extends StatelessWidget {
  final Workout workout;
  const WorkoutCard({Key? key, required this.workout}) : super(key: key);

  // TODO: Implement play video, edit and delete buttons (ubclaunchpad.atlassian.net/browse/WP-60)
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
                  workout.name,
                  style: secondaryHeadingStyle,
                ),
                subtitle: Text(
                  workout.getFormattedTotalWorkoutTime(),
                  style: bodyTextStyle,
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {},
                )),
            InkWell(
              onTap: () {},
              child: Image.network(workout.imageUrl, height: 225, fit: BoxFit.fitWidth)
            ),
            ListTile(
              minVerticalPadding: 20,
              subtitle: Text(
                "Last edited: "
                + DateFormat.yMd().format(workout.lastModificationDate),
                style: bodyTextStyle,
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
