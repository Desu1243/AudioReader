// get data about audiobooks that has been saved in files

import 'package:audioreader/pages/start_page.dart';
import 'package:flutter/material.dart';
import '../services/settings.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  void getData() async{
    Settings settings = Settings();
    bool firstOpen = true;
    firstOpen = await settings.isItFirstOpen();

    if(firstOpen){
      /*
      if(context.mounted){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const StartPage()));
      }
      */

    }else{
      // open save file
      // create Audiobook objects from saved data
      // add them to the list
    }

    // todo: move to if first open when start page is finished
    if(context.mounted){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const StartPage()));
    }
  }


  @override
  void initState() {
    super.initState();

    getData();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
