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
              title: const Text("Select extensions"),
              textColor: ThemeService.text,
              children: [
                ...settingsSupportedExtensions
                    .map((ex) => checkboxExtensionOption(ex))
                    .toList(),
              ],
            )
          ]),
        ));
  }

  Widget checkboxExtensionOption(Extension extension) => CheckboxListTile(
      value: extension.isSelected,
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (value) async {
        /// change settings after updating selected extensions
        SettingsService settingsService = SettingsService();
        setState(() {
          extension.isSelected = value!;
        });
        await settingsService.updateSettings();
      },
      title: Text(extension.extension));
}
