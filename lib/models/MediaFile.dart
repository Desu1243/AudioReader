class MediaFile{
  String name;
  String visibleName = "";
  String filePath;
  String coverImage = "";
  bool played = false;

  MediaFile({
    required this.name,
    required this.filePath,
    required this.played
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'visibleName': visibleName,
    'filePath': filePath,
    'coverImage': coverImage,
    'played': played
  };

  MediaFile.fromJson(Map<String, dynamic> json):
      name = json['name'],
      visibleName = json['visibleName'],
      filePath = json['filePath'],
      coverImage = json['coverImage'],
      played = json['played'];
}