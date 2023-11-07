class Settings{
  late List<String> sources; // list of directories added as a media file source
  late List<String> supportedExtensions; // list of supported media file extensions eg.: 'mp3', 'mp4'
  late int minAudioLength; // ranges from 1 min to 60 min
  late int theme;

  Settings({
    required this.sources,
    required this.minAudioLength,
    required this.supportedExtensions,
    required this.theme
  });

  Map<String, dynamic> toMap() {
    return {
      'sources': sources,
      'minAudioLength': minAudioLength,
      'supportedExtensions': supportedExtensions,
      'theme': theme
    };
  }

  Settings.fromJson(Map<String, dynamic> json){
    sources = List<String>.from(json['sources']);
    minAudioLength = json['minAudioLength'];
    supportedExtensions = List<String>.from(json['supportedExtensions']);
    theme = json['theme'];

  }
}