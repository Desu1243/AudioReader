import 'package:audioreader/models/MediaFile.dart';

class Audiobook{
  String folderPath;
  List<MediaFile> items;

  Audiobook({
    required this.folderPath,
    required this.items
  });

  Map<String, dynamic> toJson() => {
    'folderPath': folderPath,
    'items': items.map((item) => item.toJson()).toList()
  };

  Audiobook.fromJson(Map<String, dynamic> json):
        folderPath = json['folderPath'],
        items = List<MediaFile>.from(json['items'].map((item) => MediaFile.fromJson(item)));

}