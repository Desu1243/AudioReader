import 'package:flutter/material.dart';

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
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Center(child: Text("No media")),
      ),
    );
  }
}
