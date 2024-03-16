import 'AudioFile.dart';

class Audiobook{
  String title;
  String coverPath;
  Duration fullDuration;
  List<AudioFile> parts;

  Audiobook({
    required this.title,
    required this.coverPath,
    required this.fullDuration,
    required this.parts
  });

  Map<String, dynamic> toJson() => {
    'title': title,
    'coverPath': coverPath,
    'fullDuration': fullDuration.inMilliseconds,
    'parts': parts.map((part) => part.toJson()).toList()
  };

  Audiobook.fromJson(Map<String, dynamic> json):
    title = json['title'],
    coverPath = json['coverPath'],
    fullDuration = Duration(milliseconds: json['fullDuration']),
    parts = List<AudioFile>.from(json['items'].map((part) => AudioFile.fromJson(part)));


}