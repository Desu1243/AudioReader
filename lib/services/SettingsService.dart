import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../models/Settings.dart';

class SettingsService {
  SettingsService();
  static late Settings settings;

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _settingsFile async {
    final path = await _localPath;
    return File('$path/settings.txt');
  }

  Future<void> getSettings() async {
    try{
      final audioReaderSettingsFile = await _settingsFile;
      if(await audioReaderSettingsFile.exists()) {
        ///get data from file
        String audioReaderSettingsJson = audioReaderSettingsFile.readAsStringSync();
        var audioReaderSettings = jsonDecode(audioReaderSettingsJson);
        settings = Settings.fromJson(audioReaderSettings);

      }else{
        /// declaration of default settings
        var defaultSettings = Settings(
            sources: List<String>.empty(growable: true),
            minAudioLength: 5,
            supportedExtensions: ['mp3', 'mp4'],
            theme: 0
        );
        await audioReaderSettingsFile.writeAsString(jsonEncode(defaultSettings.toMap()));
      }
    }catch(e){
      print("save: ${e}");
    }
    print(settings.toMap());
  }

  Future<void> updateSource() async {
    /// change value of static settings variable and then call this function
    try{
      final audioReaderSettingsFile = await _settingsFile;

      ///remove repeating sources
      settings.sources = settings.sources.toSet().toList();

      await audioReaderSettingsFile.writeAsString(jsonEncode(settings.toMap()));

    }catch(e){
      print(e);
    }
  }
}
