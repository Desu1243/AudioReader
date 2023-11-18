import 'package:flutter/material.dart';

import '../services/MediaService.dart';
import '../services/SettingsService.dart';
import '../services/ThemeService.dart';

class AllAudioPage extends StatefulWidget {
  const AllAudioPage({Key? key}) : super(key: key);

  @override
  State<AllAudioPage> createState() => _AllAudioPageState();
}

class _AllAudioPageState extends State<AllAudioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeService.background,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ThemeService.appBarBg,
        title: Text("All Media",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: ThemeService.text)),
      ),
      body: RefreshIndicator(
        displacement: 10,
        onRefresh: () async {
          MediaService mediaService = MediaService();
          SettingsService settingsService = SettingsService();

          await settingsService.getSettings();
          await mediaService.getMediaFiles();

          if(context.mounted){
            setState(() {});
          }
        },
        child: ListView(children: [
          if(MediaService.allMediaFiles.isEmpty)
            Container(
              constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - 56 - 60 - 24
                  /// in order: - AppBar - BottomNavigationBar - text in the center
              ),
              child: const Center(child: Text("No media")),
            ),
        ]),
      ),
    );
  }
}
