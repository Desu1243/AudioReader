import 'package:audioreader/pages/LoadingPage.dart';
import 'package:audioreader/services/SettingsService.dart';
import 'package:audioreader/services/ThemeService.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class AddSourceDialog extends StatelessWidget {
  const AddSourceDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      insetPadding: const EdgeInsets.all(10),
      shape: const RoundedRectangleBorder(
          borderRadius:
          BorderRadiusDirectional.all(Radius.circular(30))),
      backgroundColor: Colors.white,
      child: SizedBox(
        width: 330,
        height: 220,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Add first audiobook folder", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              const Text("For app to work, you need to add a folder with your audiobook.", style: TextStyle(fontSize: 16)),
              const Text("Recommended folder hierarchy:", style: TextStyle(fontSize: 16)),
              const Text("Book title/*.mp3", style: TextStyle(fontSize: 16)),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: () async {
                      SettingsService settingsService = SettingsService();
                      await settingsService.addSource();

                      if(context.mounted){
                        Navigator.of(context).pop();
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoadingPage()));
                      }
                    },
                    child: const Text("OK")
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
