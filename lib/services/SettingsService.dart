import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
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
        var defaultSettings = Settings.defaultSettings();
        await audioReaderSettingsFile.writeAsString(jsonEncode(defaultSettings.toMap()));
        settings = defaultSettings;
      }
    }catch(e){
      print("save: ${e}");
    }
    print(settings.toMap());
  }

  Future<void> updateSettings() async {
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

  static List<String> allowedExtensions(){
    List<String> allowedExtensions = List.empty(growable: true);
    for(int i = 0; i < settings.supportedExtensions.length; i++){
      allowedExtensions.add(settings.supportedExtensions[i].extension);
    }
    return allowedExtensions;
  }

  Future<void> addSource() async {
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();

    if (selectedDirectory != null) {
      SettingsService.settings.sources.add(selectedDirectory);
      SettingsService settingsService = SettingsService();
      await settingsService.updateSettings();
    }
  }
}
