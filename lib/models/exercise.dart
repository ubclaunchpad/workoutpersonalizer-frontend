// ignore_for_file: file_names
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Exercise>> fetchExercises(String endpoint) async {
  final res = await http.get(Uri.parse(endpoint));
  if (res.statusCode == 200) {
    List<dynamic> decoded = jsonDecode(res.body);
    List<Exercise> exercises = [];
    for (final exercise in decoded) {
      final parsed = Exercise.fromJson(exercise);
      exercises.add(parsed);
    }
    return exercises;
  } else {
    throw Exception('Failed to load all exercises');
  }
}

Future<List<Exercise>> fetchAllExercises() async {
  // TODO: unhardcode endpoint
  return fetchExercises('https://ec2-54-193-129-230.us-west-1.compute.amazonaws.com:8000/exercises');
}

Future<List<Exercise>> fetchSavedExercises() async {
  // TODO: unhardcode endpoint, esp userId
  return fetchExercises(
      'https://ec2-54-193-129-230.us-west-1.compute.amazonaws.com:8000/users/b70820ae-d0a3-411b-9217-0bf2370e7139/savedExercises');
}

class Exercise {
  final int id;
  final String name;
  final String description;
  final String thumbnailSrc;
  final String videoSrc;
  final int length; // in seconds
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<String> tags;

  Exercise(
    this.id,
    this.name,
    this.description,
    this.thumbnailSrc,
    this.videoSrc,
    this.length,
    this.createdAt,
    this.updatedAt,
    this.tags,
  );

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      json['id'],
      json['name'],
      json['description'],
      json['thumbnailSrc'],
      json['videoSrc'],
      json['length'],
      DateTime.parse(json['createdAt']),
      DateTime.parse(json['updatedAt']),
      [
        /*
        ...json['DifficultyLevels'],
        ...json['ExerciseTypes'],
        ...json['Equipment'],
        ...json['MuscleGroups']
        */
      ],
    );
  }
}
