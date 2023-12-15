import 'package:audioplayers/audioplayers.dart';
import 'package:audioreader/models/Playlist.dart';
import 'package:audioreader/services/SettingsService.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

import '../models/MediaFile.dart';

class MediaService {
  MediaService();

  static List<MediaFile> allMediaFiles = List.empty(growable: true);
  static List<Playlist> allPlaylists = List.empty(growable: true);

  Future<void> getMediaFiles() async {
    /// only files with original names. no option to change visible name
    /// will be shown in All Media tab with name: "folder filename"

    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
      Permission.manageExternalStorage,
    ].request();

    allMediaFiles = List.empty(growable: true);

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
              /// duration check
              if (duration.inMinutes < SettingsService.settings.minAudioLength){
                continue;
              }

              /// check if media file have a correct extension
              if (allowedExtensions.contains(extension)) {
                var name =
                    "${splitPath[splitPath.length - 2]} ${splitPath.last}";
                allMediaFiles.add(MediaFile(
                    name: name, filePath: filesList[j].path, played: false));
              }
            }
          }
        }
      }
    } catch (e) {
      print("get all Media files: $e");
    }
  }

  Future<void> getPlaylists() async {
    /// get all playlists from playlist save file
    /// set them as static variable
  }

  Future<void> createPlaylist(String name) async {
    ///
  }

  Future<void> addToPlaylist(Playlist playlist) async {}

  Future<void> removeFromPlaylist(MediaFile file, Playlist playlist) async {}

  Future<void> changePlaylistCover(String image, Playlist playlist) async {}

  Future<void> renamePlaylist(String newName, Playlist playlist) async {}
}
