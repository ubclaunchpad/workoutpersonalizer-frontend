import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workoutpersonalizer_frontend/models/workout.dart';

class WorkoutCard extends StatelessWidget {
  final Workout workout;
  const WorkoutCard({Key? key, required this.workout}) : super(key: key);

  // TODO: Implement play video, edit and delete buttons (WP-60)
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 365,
      width: 400,
      child: Card(
        child:
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          ListTile(
              title: Text(workout.name),
              subtitle: Text(
                workout.getFormattedTotalWorkoutTime(),
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
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
              minVerticalPadding: 15,
              subtitle: Text(
                "Last modified: " 
                + DateFormat.yMd().add_jm().format(workout.lastModificationDate)
                + "\nCreated: "
                + DateFormat.yMd().add_jm().format(workout.creationDate),
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {},
              )),
        ]),
      ),
    );
  }
}
