import 'package:audioreader/pages/LoadingPage.dart';
import 'package:audioreader/services/SettingsService.dart';
import 'package:audioreader/services/ThemeService.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class CreateOptionMenu extends StatelessWidget {
  const CreateOptionMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      insetPadding: const EdgeInsets.all(0),
      shape: const RoundedRectangleBorder(
          borderRadius:
              BorderRadiusDirectional.vertical(top: Radius.circular(30))),
      alignment: Alignment.bottomCenter,
      backgroundColor: ThemeService.backgroundSecondary,
      child: SizedBox(
        height: 220,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Add Source",
                    style: TextStyle(
                      color: ThemeService.primary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              TextButton( /// add files source button
                  onPressed: () async {
                    /// open select directory menu and if selected something add it to source
                    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();

                    if (selectedDirectory != null) {
                      SettingsService.settings.sources.add(selectedDirectory);
                      SettingsService settingsService = SettingsService();
                      await settingsService.updateSettings();
                    }
                    if(context.mounted){
                      /// close alert, and then reload the app
                      Navigator.of(context).pop();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoadingPage()));
                    }
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Add audiobook source",
                      style: TextStyle(fontSize: 16, color: ThemeService.secondary),
                    ),
                  )),
              TextButton( /// cancel button
                  onPressed: () {
                      Navigator.of(context).pop();
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Cancel",
                      style: TextStyle(fontSize: 16, color: ThemeService.secondary),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
