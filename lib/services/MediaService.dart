import 'package:audioplayers/audioplayers.dart';
import 'package:audioreader/models/Audiobook.dart';
import 'package:audioreader/services/SettingsService.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

import '../models/MediaFile.dart';

class MediaService {
  MediaService();

  static List<Audiobook> allAudiobooks = List.empty(growable: true);
  //static List<MediaFile> allMediaFiles = List.empty(growable: true);

  Future<void> getAudiobooks() async {
    /// get all playlists from playlist save file
    /// set them as static variable
  }

  Future<void> getMediaFiles(String folderPath) async {

    await [
      Permission.storage,
      Permission.manageExternalStorage,
    ].request();

    List<MediaFile> allMediaFiles = List.empty(growable: true);

    try {
      for (int i = 0; i < SettingsService.settings.sources.length; i++) {
        /// get directory from added sources
        Directory directory = Directory(SettingsService.settings.sources[i]);

        if (await directory.exists()) {
          /// get list of files from directory
          var filesList =
              directory.listSync(recursive: false, followLinks: false);
          for (int j = 0; j < filesList.length; j++) {
            /// splitting path for easier use
            List<String> splitPath = filesList[j].path.split("/");
            String extension = (splitPath.last.split(".")).last;
            List<String> allowedExtensions =
                SettingsService.allowedExtensions();

            /// check if media files are correct duration
            AudioPlayer player = AudioPlayer();
            await player.setSource(DeviceFileSource(filesList[j].path));
            var duration = await player.getDuration();
            await player.dispose();

            if (duration != null) {
              /// check if media file have a correct extension
              if (allowedExtensions.contains(extension)) {
                var name =
                    "${splitPath[splitPath.length - 2]} ${splitPath.last}";
                allMediaFiles.add(MediaFile(
                    name: name,
                    filePath: filesList[j].path,
                    played: false,
                    duration: duration));
              }
            }
          }
        }
      }
    } catch (e) {
      print("get all Media files: $e");
    }
  }



  Future<void> changeAudiobookCover(String image, Audiobook playlist) async {}

  Future<void> renameAudiobook(String newName, Audiobook playlist) async {}
}
