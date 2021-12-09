// ignore_for_file: file_names

class ExerciseType {
  final int id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  ExerciseType(
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  );

  factory ExerciseType.fromJson(Map<String, dynamic> json) {
    return ExerciseType(
      json['id'],
      json['name'],
      json['createdAt'],
      json['updatedAt'],
    );
  }
}