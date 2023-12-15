import 'package:audioreader/widgets/MediaWidget.dart';
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
  final ScrollController scrollController = ScrollController();

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
        child: pageContent(),
      ),
    );
  }

  Widget pageContent(){
    if(MediaService.allMediaFiles.isEmpty){
      return const Center(child: Text("No media"));
    }else{
      return ListView.builder(
        itemCount: MediaService.allMediaFiles.length,
        controller: scrollController,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) => MediaWidget(mediaFile: MediaService.allMediaFiles[index]),
      );
    }
  }
}
