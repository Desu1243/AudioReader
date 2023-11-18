import 'package:audioreader/services/SettingsService.dart';
import 'package:audioreader/services/ThemeService.dart';
import 'package:flutter/material.dart';

import '../services/MediaService.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeService.background,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ThemeService.appBarBg,
        title: Text("Library",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: ThemeService.text)),
      ),
      body: RefreshIndicator(
        displacement: 10,
        onRefresh: () async {
          MediaService mediaService = MediaService();
          SettingsService settingsService = SettingsService();

          await settingsService.getSettings();
          await mediaService.getMediaFiles();
        },
        child: ListView(children: [
          if(MediaService.allPlaylists.isEmpty)
          Container(
            constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height - 56 - 60 - 24
                /// in order: - AppBar - BottomNavigationBar - text in the center
                ),
            child: const Center(child: Text("No playlists created")),
          ),
        ]),
      ),
    );
  }
}
