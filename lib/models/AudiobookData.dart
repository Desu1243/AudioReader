
class AudiobookData{
  String name;
  String folderPath;
  String coverImage = "assets/defaultCover.svg";

  AudiobookData({
    required this.name,
    required this.folderPath,
    required this.coverImage,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'coverImage': coverImage,
  };

  AudiobookData.fromJson(Map<String, dynamic> json):
        name = json['name'],
        folderPath = json['folderPath'],
        coverImage = json['coverImage'];

}