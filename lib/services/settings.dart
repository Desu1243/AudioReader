import 'dart:io';
import 'package:audioreader/main.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class Settings{
  String mainFolderPath = "/storage/emulated/0/Audiobooks";
  List<Permission> permissions = [
    Permission.audio,
    Permission.notification
  ];

  Future<bool> getPermissions() async {
    Map<Permission, PermissionStatus> statuses = await permissions.request();
    return true;
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _settingsFile async {
    final path = await _localPath;
    return File('$path/settings.txt');
  }

  Future<bool> saveSettings() async {
    final file = await _settingsFile;

    return true;
  }

  void changeAudiobooksFolder(String newFolderPath){
    mainFolderPath = newFolderPath;
  }

  Future<bool> isItFirstOpen() async {
    try {
      final file = await _settingsFile;

      // Read the file
      final contents = await file.readAsString();

      if(contents.isNotEmpty){
        return false;
      }
      return true;
    } catch (e) {
      print(e);
    }
    return false;
  }

  /// Returns settings in JSON format as a string
  String toJson(){

    return "";
  }

  /// imports settings data from json formatted string
  void fromJson(){

  }
}