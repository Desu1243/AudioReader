import 'package:flutter/material.dart';

class AllAudioPage extends StatefulWidget {
  const AllAudioPage({Key? key}) : super(key: key);

  @override
  State<AllAudioPage> createState() => _AllAudioPageState();
}

class _AllAudioPageState extends State<AllAudioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text("All Audio",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Text("none"),
      ),
    );
  }
}
