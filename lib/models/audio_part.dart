class AudioPart {
  late String audioFilePath;
  late Duration duration;
  Duration progress = Duration.zero;
  bool isComplete = false;

  AudioPart();

  String getTitle(){
    return audioFilePath.split("/").last.split(".").first;
  }

  void calculateDuration(){
    
  }
}
