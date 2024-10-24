// get data about audiobooks that has been saved in files

import 'package:audioreader/pages/start_page.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  void getDataFromFiles() async{

    await Future.delayed(Duration(seconds: 2));


    if(context.mounted){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const StartPage()));
    }
  }

  @override
  void initState() {
    super.initState();

    // if first open and no permissions:
    getDataFromFiles();
    // open save file
    // create Audiobook objects from saved data
    // add them to the list
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
