// ignore_for_file: file_names

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
      json['createdAt'],
      json['updatedAt'],
      json['tags'],
    );
  }
}