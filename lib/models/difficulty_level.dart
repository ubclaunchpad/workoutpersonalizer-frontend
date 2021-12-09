// ignore_for_file: file_names

class DifficultyLevel {
  final int id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  DifficultyLevel(
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  );

  factory DifficultyLevel.fromJson(Map<String, dynamic> json) {
    return DifficultyLevel(
      json['id'],
      json['name'],
      json['createdAt'],
      json['updatedAt'],
    );
  }
}