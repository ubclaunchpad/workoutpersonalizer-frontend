import 'dart:html';

class Exercise {
  final int id;
  final String name;
  final String description;
  final String thumbnailSrc;
  final String videoSrc;
  // TODO: change length to Duration (ticket: WP-84)
  final int length; // seconds?

  Exercise(
    this.id,
    this.name,
    this.description,
    this.thumbnailSrc,
    this.videoSrc,
    this.length
  );

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      json['id'],
      json['title'],
      json['description'],
      json['thumbnailSrc'],
      json['videoSrc'],
      json['length'],
    );
  }
}