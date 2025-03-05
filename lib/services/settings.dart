import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class Settings {
  String mainFolderPath = "/storage/emulated/0/Audiobooks";
  List<Permission> permissions = [Permission.audio, Permission.notification];

  Settings();

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

  Future<void> saveSettings() async {
    try {
      final file = await _settingsFile;
      Map<String, dynamic> mapSettings = {"mainFolderPath": mainFolderPath};
      String jsonSettings = jsonEncode(mapSettings);
      await file.writeAsString(jsonSettings);
    } catch (e) {
      print("Save settings $e");
    }
  }

  /// imports settings data from json formatted string
  Future<void> readSettingsFromFile() async {
    try {
      final file = await _settingsFile;
      String jsonSettings = await file.readAsString();
      Map<String, dynamic> mapSettings = jsonDecode(jsonSettings);

      mainFolderPath = mapSettings['mainFolderPath'];
    } catch (e) {
      print("Settings read from file: $e");
    }
  }

  void changeAudiobooksFolder(String newFolderPath) {
    mainFolderPath = newFolderPath;
  }

  Future<bool> isItFirstOpen() async {
    try {
      final file = await _settingsFile;
      if (!(await file.exists())) {
        return true;
      }

      final contents = await file.readAsString();
      if (contents.isNotEmpty) {
        return false;
      }
    } catch (e) {
      print("Is it first open: $e");
    }
    return true;
  }
}
