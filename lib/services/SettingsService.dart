class SettingsService {
  SettingsService();
  late List<String> addedDirectories; // list of directories added as a media file source
  late List<String> supportedExtensions; // list of supported media file extensions eg.: 'mp3', 'mp4'
  late int minAudioLength; // ranges from 1 min to 60 min
  late int theme;
}
