import 'package:audioreader/models/Extension.dart';

class Settings{
  late List<String> sources; // list of directories added as a media file source
  late List<Extension> supportedExtensions; // list of supported media file extensions eg.: 'mp3', 'mp4'
  late int theme;

  Settings({
    required this.sources,
    required this.supportedExtensions,
    required this.theme
  });

  Map<String, dynamic> toMap() {
    return {
      'sources': sources,
      'supportedExtensions': supportedExtensions.map((ex){
        return ex.toMap();
      }).toList(),
      'theme': theme
    };
  }

  Settings.fromJson(Map<String, dynamic> json){
    sources = List<String>.from(json['sources']);
    supportedExtensions = List<Extension>.from(json['supportedExtensions'].map((ex)=>Extension.fromJson(ex)));
    theme = json['theme'];
  }

  static Settings defaultSettings() {
    return Settings(
        sources: List<String>.empty(growable: true),
        supportedExtensions: [
          Extension(extension: 'mp3', isSelected: true),
          Extension(extension: 'mp4', isSelected: true),
          Extension(extension: 'm4a', isSelected: true),
          Extension(extension: 'wav', isSelected: true),
        ],
        theme: 0
    );
  }
}