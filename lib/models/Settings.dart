class Settings{
  int minAudioLength;

  Settings({
    required this.minAudioLength
  });

  Map<String, dynamic> toJson() => {
    'minAudioLength': minAudioLength,
  };

  Settings.fromJson(Map<String, dynamic> json):
        minAudioLength = json['minAudioLength'];
}