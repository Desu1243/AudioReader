class AudioFile{
  String name;
  String path;
  Duration duration;
  Duration progress;

  AudioFile({
   required this.name,
   required this.path,
   required this.duration,
   required this.progress
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'path': path,
    'duration': duration.inMilliseconds,
    'progress': progress.inMilliseconds
  };

  AudioFile.fromJson(Map<String, dynamic> json):
    name = json['name'],
    path = json['path'],
    duration = Duration(milliseconds: json['duration']),
    progress = Duration(milliseconds: json['progress']);

}