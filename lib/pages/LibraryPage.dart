import 'package:audioreader/services/ThemeService.dart';
import 'package:flutter/material.dart';

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
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: ThemeService.text)),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Center(child: Text("none")),
      ),
    );
  }
}
