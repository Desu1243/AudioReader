// page that appears on the first launch of the app
// asks user for the main audiobook folder, and permissions

import 'package:audioreader/services/settings.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  Settings settingsService = Settings();

  void onPressedChangeFolder() async {
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();

    if (selectedDirectory != null) {
      setState(() {
        settingsService.changeAudiobooksFolder(selectedDirectory);
        settingsService.saveSettings();
      });
    }
  }

  void onPressedConfirm(){
    // save settings
    // get audiobooks from folder
    // save audiobooks data to file
    // push to loading page
    settingsService.saveSettings();

  }

  @override
  void initState() {
    super.initState();
    settingsService.getPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Audiobook folder selection"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("AudioReader automatically selects a folder where you store all your audiobooks."),
                      const SizedBox(height: 10),
                      const Text("Selected folder:"),
                      Text(settingsService.mainFolderPath),
                      const SizedBox(height: 10),
                      const Text("Do you want to change it?"),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(onPressed: onPressedChangeFolder, child: const Text("Change folder")),
                          ElevatedButton(onPressed: onPressedConfirm, child: const Text("It's OK"))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
