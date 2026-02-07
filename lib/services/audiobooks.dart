import 'dart:io';
import 'package:audioreader/models/audio_part.dart';
import 'package:audioreader/models/audiobook.dart';
import 'package:just_audio/just_audio.dart' as just_audio;
import 'package:media_info/media_info.dart';
import 'package:path_provider/path_provider.dart';

class Audiobooks{
  static List<Audiobook> audiobooksData = List.empty(growable: true);

  Future<File> get _audiobooksDataFile async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    return File('$path/audiobooks_data.txt');
  }

  /// read audiobooks data from save file
  void getSavedData(){

  }

  /// save audiobooks data into a file
  void saveData(){

  }

  /// create audiobook object for every folder in the main audiobooks folder (from folder)
  Future<void> fetchAudiobooks(String mainFolderPath) async {
    File saveFile = await _audiobooksDataFile;
    final player = just_audio.AudioPlayer();
    List<Audiobook> newAudiobooks = List.empty(growable: true);

    var mainFolder = Directory(mainFolderPath);
    /// TODO: if that folder does not exist, then create it and end function with empty list
    List audiobookPaths = mainFolder.listSync();

    /// get data from each audiobook
    for(var audiobookRaw in audiobookPaths){
      String title = audiobookRaw.toString().split("/").last.split("'").first;
      Audiobook newAudiobook = Audiobook(title: title);
      List<AudioPart> newAudiobookParts = List.empty(growable: true);

      /// get data from each part of the audiobook
      var audiobookFolderContents = audiobookRaw.listSync();
      for(var audiobookPartRaw in audiobookFolderContents){
        String audiobookPartPath = audiobookPartRaw.toString().split("'")[1];
        String extension = audiobookPartPath.split("/").last.split(".").last;

        /// skip not audio files
        if(extension != "mp3" && extension != "mp4"){
          // print("Wrong extension! $extension");
          continue;
        }

        Duration? partDuration = await player.setUrl(audiobookPartPath);

        AudioPart newAudiobookPart = AudioPart();
        if(partDuration != null) {
              newAudiobookPart.audioFilePath = audiobookPartPath;
              newAudiobookPart.duration = partDuration;
        }else{
          throw("Audiobooks: error reading audio file duration");
        }


        /// add part of the audiobook to that audiobook's list of parts
        newAudiobookParts.add(newAudiobookPart);
      }
      /// add fetched audiobook to the list
      newAudiobook.parts = [...newAudiobookParts];
      newAudiobook.calculateFullDuration();
      newAudiobooks.add(newAudiobook);
    }

    /// remove all audiobooks that are too short
    for(var ab in newAudiobooks){
      if(ab.fullDuration.inMinutes < 1){
        newAudiobooks.remove(ab);
      }
    }
    
    if(saveFile.existsSync()){
      /// todo: retrieve data for fresh audiobooks from save file
    }

    audiobooksData = [...newAudiobooks];
    print(newAudiobooks);
    for(var a in newAudiobooks){
      print(a.fullDuration);
    }

    player.dispose();
  }

}