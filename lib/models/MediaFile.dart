class MediaFile{
  String name;
  String visibleName = "";
  String filePath;
  String coverImage = "";
  Duration duration = const Duration();
  bool played = false;

  MediaFile({
    required this.name,
    required this.filePath,
    required this.duration,
    required this.played
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'visibleName': visibleName,
    'filePath': filePath,
    'duration': duration,
    'coverImage': coverImage,
    'played': played
  };

  MediaFile.fromJson(Map<String, dynamic> json):
      name = json['name'],
      visibleName = json['visibleName'],
      filePath = json['filePath'],
      duration = json['duration'],
      coverImage = json['coverImage'],
      played = json['played'];
}