import 'package:audioreader/models/audio_part.dart';

class Audiobook {
  Duration fullDuration;
  String coverImagePath = "";
  int progressPercentage;
  List<AudioPart> parts;

  Audiobook(
      {required this.fullDuration,
      required this.progressPercentage,
      required this.parts});

  void calculateProgressPercentage(){
    
  }
}
