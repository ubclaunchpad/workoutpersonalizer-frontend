// ignore_for_file: file_names

class Exercise {
  final int id;
  final String name;
  final String description;
  final String thumbnailSrc;
  final String videoSrc;
  final int length; // units?
  final List<String> tags;

  Exercise(
    this.id,
    this.name,
    this.description, 
    this.thumbnailSrc, 
    this.videoSrc, 
    this.length
    this.tags
  );

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      json['id'],
      json['title'],      
      json['description'],
      json['thumbnailSrc'],
      json['videoSrc'],
      json['length'],
      json['tags'],
    );
  }
}