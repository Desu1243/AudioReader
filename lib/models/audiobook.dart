import 'package:audioreader/models/audio_part.dart';

class Audiobook {
  Duration fullDuration;
  String coverImagePath = "";
  List<AudioPart> parts;

  Audiobook({required this.fullDuration, required this.parts});

  int calculateProgressPercentage(){
    
    return 0;
  }
}
