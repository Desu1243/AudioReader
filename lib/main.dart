import 'package:audioreader/pages/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);

  runApp(const MaterialApp(
    title: "Audioreader",
    debugShowCheckedModeBanner: false,
    home: LoadingPage(),
  ));
}
