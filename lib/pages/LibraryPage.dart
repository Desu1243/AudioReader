import 'package:audioreader/services/SettingsService.dart';
import 'package:audioreader/services/ThemeService.dart';
import 'package:audioreader/widgets/AddSourceDialog.dart';
import 'package:flutter/material.dart';

import '../services/MediaService.dart';
import '../widgets/AudiobookWidget.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {

  @override
  void initState() {
    super.initState();
    ///open add first source dialog on start
    ()async{
      Future.delayed(Duration.zero,() {
        if (SettingsService.settings.sources.isEmpty) {
          showDialog(
              context: context, builder: (context) => const AddSourceDialog());
        }
      });
    }();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeService.backgroundPrimary,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ThemeService.backgroundPrimary,
        title: Text("Library",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: ThemeService.primary)),
      ),
      body: RefreshIndicator(
          displacement: 10,
          onRefresh: () async {
            MediaService mediaService = MediaService();
            SettingsService settingsService = SettingsService();

            await settingsService.getSettings();
            await mediaService.getAudiobooksData();
          },
          child: pageContent()),
    );
  }

  Widget pageContent() {
    if (MediaService.allAudiobooksData.isEmpty) {
      return const Center(child: Text("No audiobooks"));
    }

    return ListView.builder(
        itemBuilder: (context, index) =>
            AudiobookWidget(audiobookData: MediaService.allAudiobooksData[index]));
  }
}
