import 'package:audioreader/models/audio_part.dart';

class Audiobook {
  String title;
  late Duration fullDuration;
  String coverImagePath = "";
  late List<AudioPart> parts;
  bool enabled = true;

  Audiobook({required this.title});

  int calculateProgressPercentage(){
    
    return 0;
  }

  void calculateFullDuration(){
    Duration tempDuration = Duration.zero;
    for(var part in parts){
      tempDuration = tempDuration + part.duration;
    }
    fullDuration = tempDuration;
  }

  /// in converting to json format skip enabled property for it should be checked on reading data
}
