import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quran/core/constant.dart';

class Favuritepage extends StatelessWidget {
  const Favuritepage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            "Favurite Ayat",
            style: TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection('SavedAyat').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> SavedAya =
                      snapshot.data!.docs[index].data() as Map<String, dynamic>;
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10),
                    child: Column(
                      children: [
                        CustomfavuriteListtile(SavedAya: SavedAya),
                        Divider()
                      ],
                    ),
                  );
                },
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const Center(child: Text("Empty List"));
            }
          },
        ),
      ),
    );
  }
}

class CustomfavuriteListtile extends StatefulWidget {
  const CustomfavuriteListtile({
    super.key,
    required this.SavedAya,
  });

  final Map<String, dynamic> SavedAya;

  @override
  State<CustomfavuriteListtile> createState() => _CustomfavuriteListtileState();
}

class _CustomfavuriteListtileState extends State<CustomfavuriteListtile> {
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
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Stack(
        children: [
          Image.asset(
            'assets/icon_no.png',
            width: 60,
            height: 40,
          ),
          Positioned(
            right: 20,
            bottom: 9,
            child: Text(
              "${widget.SavedAya['AyaNumber']}",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      title: Text(
        "${widget.SavedAya['Ayatext']}",
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      subtitle: Text(
        "${widget.SavedAya['SuarhName']} ",
        style: TextStyle(color: Colors.white.withOpacity(.5), fontSize: 18),
      ),
      trailing: IconButton(
        onPressed: () async {
          log('play');
          playerState == PlayerState.playing
              ? pausemusic()
              : playmusic(url: widget.SavedAya['Audio']);
        },
        icon: playerState == PlayerState.completed
            ? Icon(Icons.play_arrow)
            : playerState == PlayerState.paused
                ? Icon(
                    Icons.play_arrow,
                    color: kprimarycolor,
                  )
                : Icon(Icons.pause),
      ),
    );
  }
}
