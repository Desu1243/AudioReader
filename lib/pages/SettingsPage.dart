import 'package:audioreader/services/SettingsService.dart';
import 'package:flutter/material.dart';

import '../models/Extension.dart';
import '../services/ThemeService.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<Extension> settingsSupportedExtensions = [
    ...SettingsService.settings.supportedExtensions
  ];
  List<String> addedSources = SettingsService.settings.sources;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeService.background,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: ThemeService.appBarBg,
          title: Text("Settings",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: ThemeService.text)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(children: [
            ExpansionTile(
              title: const Text("Allowed extensions"),
              //textColor: ThemeService.text,
              children: [
                ...(settingsSupportedExtensions
                    .map((ex) => checkboxExtensionOption(ex))
                    .toList()),
              ],
            ),
            ExpansionTile(
              title: const Text("Added sources"),
              //textColor: ThemeService.text,
              children: [
                if (SettingsService.settings.sources.isEmpty)
                  const Padding(
                      padding: EdgeInsets.all(20),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("No sources added", textAlign: TextAlign.left))),
                ...(addedSources.map((src)=>sourceOption(src)).toList())
              ],
            ),
          ]),
        ));
  }

  Widget checkboxExtensionOption(Extension extension) => CheckboxListTile(
      value: extension.isSelected,
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (value) async {
        /// change settings after updating selected extensions
        SettingsService settingsService = SettingsService();
        if(context.mounted){
          setState(() {
            extension.isSelected = value!;
          });
          await settingsService.updateSettings();
        }
      },
      title: Text(extension.extension));


  Widget sourceOption(String src) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Row(
      children: [
        Expanded(child: Text((src.split('0/')).last)),
        IconButton(
            onPressed: () async {
              /// delete from sources list and save settings
              SettingsService settingsService = SettingsService();
              if(context.mounted){
                setState(() {
                  addedSources.remove(src);
                });
                await settingsService.updateSettings();
              }
            },
            icon: const Icon(Icons.delete), color: ThemeService.text)
      ],
    ),
  );

}
