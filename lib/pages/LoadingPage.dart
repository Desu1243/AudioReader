import 'package:audioreader/pages/MainPage.dart';
import 'package:audioreader/services/MediaService.dart';
import 'package:audioreader/services/SettingsService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/ThemeService.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  Future<void> getData() async {
    SettingsService settingsService = SettingsService();
    MediaService mediaService = MediaService();
    await settingsService.getSettings();
    await mediaService.getAudiobooks();

    if(context.mounted){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainPage()));
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color.fromRGBO(225, 225, 225, 1), Color.fromRGBO(160, 160, 160, 1)],
                begin: Alignment.topCenter,
                end: Alignment.bottomLeft)),
        child: const Center(
          child: SpinKitWave(
            color: Color.fromRGBO(245, 245, 245, 1),
            size: 40,
          ),
        ),
      ),
    );
  }
}
