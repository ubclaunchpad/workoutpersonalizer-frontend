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
