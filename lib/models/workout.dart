import 'package:workoutpersonalizer_frontend/models/exercise.dart';

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
      this.deletionDate);

  String getFormattedTotalWorkoutTime() {
    return totalWorkoutTime.toString().split('.').first.padLeft(2, "0");
  }
}
