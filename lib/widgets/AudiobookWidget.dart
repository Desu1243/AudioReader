import 'package:audioreader/services/ThemeService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/Audiobook.dart';

class AudiobookWidget extends StatelessWidget {
  final Audiobook audiobook;
  const AudiobookWidget({super.key, required this.audiobook});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              /// music disc image
              Container(
                height: 50,
                width: 50,
                color: CupertinoColors.inactiveGray,
              ),

              /// media file info
              Container(
                margin: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(audiobook.name, style: const TextStyle(color: Colors.black)),
                    Text(
                        "",
                        style: TextStyle(color: ThemeService.durationText)),
                  ],
                ),
              ),
            ],
          ),

          /// three dots menu
          IconButton(
            icon: Icon(Icons.more_vert_rounded),
            onPressed: (){},
            iconSize: 34,
            color: ThemeService.durationText,
          )
        ],
      ),
    );
  }
}
