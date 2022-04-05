import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:workoutpersonalizer_frontend/models/exercise.dart';

Future<List> fetchWorkouts() async {
  final response = await http.get(Uri.parse(
      'http://localhost:8000/users/b70820ae-d0a3-411b-9217-0bf2370e7139/workouts/detailed'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    final responseBody = jsonDecode(response.body);
    var workouts = [];
    for (final responseItem in responseBody) {
      workouts.add(Workout.fromJson(responseItem));
    }
    return workouts;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load workouts');
  }
}

class Workout {
  String id;
  String userId;
  String name;
  String imageUrl;
  List<Exercise> exercises;
  Duration totalWorkoutTime;
  DateTime creationDate;
  DateTime lastModificationDate;
  DateTime deletionDate;

  Workout(
    this.id,
    this.userId,
    this.name,
    this.imageUrl,
    this.exercises,
    this.totalWorkoutTime,
    this.creationDate,
    this.lastModificationDate,
    this.deletionDate,
  );

  factory Workout.fromJson(Map<String, dynamic> json) {
    return Workout(
      json['id'],
      json['userId'],
      json['name'],
      json['imageUrl'],
      [],
      Duration(seconds: int.parse(json['totalWorkoutTime'])),
      DateTime.parse(json['creationDate']),
      DateTime.parse(json['lastModificationDate']),
      DateTime.parse(json['deletionDate']),
    );
  }

  String getFormattedTotalWorkoutTime() {
    List<String> totalWorkoutTimeSplit =
      totalWorkoutTime.toString().split('.').first.split(':');
    String totalWorkoutTimeFormatted = "";
    String hours = totalWorkoutTimeSplit[0];
    String minutes = int.parse(totalWorkoutTimeSplit[1]).toString();
    if (hours != "0") {
      totalWorkoutTimeFormatted = hours + " hr";
    }
    return totalWorkoutTimeFormatted + minutes + " min";
  }
}
