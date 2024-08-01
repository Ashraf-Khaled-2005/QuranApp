import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:quran/core/constant.dart';
import 'package:quran/features/home/presentation/view_model/surah_model/ayah.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:quran/features/home/presentation/view_model/surah_model/surah_model.dart';
import 'package:uuid/uuid.dart';

class Surahview extends StatefulWidget {
  final SurahModel SavedSuarh;
  final Ayahs ayahs;
  const Surahview({super.key, required this.ayahs, required this.SavedSuarh});

  @override
  State<Surahview> createState() => _SurahviewState();
}

class _SurahviewState extends State<Surahview> {
  bool isClicked = false;

  AudioPlayer audioplayer = AudioPlayer();
  PlayerState playerState = PlayerState.paused;

  Future<void> playmusic({required String url}) async {
    // await audioplayer.setSource(UrlSource(url));
    await audioplayer.play(UrlSource(url)); // will immediately start playing
  }

  Future<void> pausemusic() async {
    await audioplayer.pause();
  }

  Future<void> stopmusic() async {
    await audioplayer.stop();
  }

  @override
  void initState() {
    super.initState();
    audioplayer.onPlayerStateChanged.listen((PlayerState s) {
      log('Current player state: $s');
      setState(() => playerState = s);
      ;
    });
    audioplayer.onPlayerComplete.listen((event) {
      log('Audio finished playing.');
      setState(() {
        playerState = PlayerState.completed;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color.fromARGB(255, 36, 48, 112)),
          width: w,
          height: 60,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 32,
                backgroundColor: kprimarycolor,
                child: Text(
                  "${widget.ayahs.numberInSurah}",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () async {
                  log('play');
                  playerState == PlayerState.playing
                      ? pausemusic()
                      : playmusic(url: widget.ayahs.audio!);
                },
                icon: playerState == PlayerState.completed
                    ? Icon(
                        Icons.play_arrow,
                        size: 18,
                      )
                    : playerState == PlayerState.paused
                        ? Icon(
                            Icons.play_arrow,
                            color: kprimarycolor,
                          )
                        : Icon(
                            Icons.pause,
                            size: 18,
                          ),
              ),
              SizedBox(
                width: 15,
              ),
              InkWell(
                onTap: () async {
                  isClicked = true;
                  setState(() {});
                  final uuid = Uuid().v4();
                  FirebaseFirestore firestore = FirebaseFirestore.instance;
                  await firestore.collection('SavedAyat').doc(uuid).set({
                    'SuarhName': widget.SavedSuarh.englishName,
                    'AyaNumber': widget.ayahs.numberInSurah,
                    'Ayatext': widget.ayahs.text,
                    'Audio': widget.ayahs.audio,
                    'id': uuid
                  });

                  log("done");
                },
                child: Image.asset(
                  'assets/icon_bookmark.png',
                  height: 30,
                  color: isClicked == true ? kprimarycolor : Colors.white,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          '${widget.ayahs.text}',
          textAlign: TextAlign.right,
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
