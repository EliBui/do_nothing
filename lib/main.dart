import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

AudioPlayer audioPlayer = AudioPlayer();
bool playing = false;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Do Nothing'),
        ),
        body: myLayoutWidget(),
      ),
    );
  }
}

Widget myLayoutWidget(){
  var audio = AudioPlayer();
  return Center(
    child: Column(
      children: [
        Image.asset('assets/bruhNoMars.jpg'),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: IconButton(
            icon: Icon(Icons.play_arrow),
            onPressed: () async {
              playing = true;
              log(playing.toString());
              await audio.play(
              'assets/song.mp3');
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: IconButton(
            icon: Icon(Icons.pause),
            onPressed: () async {
              if (playing) {
                await audio.pause();
                log(playing.toString());
                playing = false;
              }
              else {
                await audio.resume();
                log(playing.toString());
                playing = true;
              }
            }),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: IconButton(
            icon: Icon(Icons.stop),
            onPressed: () async {
              await audio.stop();
              playing = false;
            }),
        ),
      ],
    ),
  );
}

// class AudioPlayerWidget extends StatefulWidget {
//   final String url;
//   final bool isAsset;
//
//   const AudioPlayerWidget ({
//     Key? key,
//     required this.url,
//     this.isAsset = false,
//   }) : super(key: key);
//
//   @override
//   _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
// }