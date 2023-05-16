import 'package:audioreader/models/MediaFile.dart';

class Playlist{
  String name;
  String coverImage;
  List<MediaFile> items;

  Playlist({
    required this.name,
    required this.coverImage,
    required this.items
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'coverImage': coverImage,
    'items': items.map((item) => item.toJson()).toList()
  };

  Playlist.fromJson(Map<String, dynamic> json):
        name = json['name'],
        coverImage = json['coverImage'],
        items = List<MediaFile>.from(json['items'].map((item) => MediaFile.fromJson(item)));

}