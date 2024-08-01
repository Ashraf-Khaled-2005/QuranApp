import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quran/features/home/presentation/view_model/surah_model/surah_model.dart';

import 'widgets/Surahdetail.dart';

class Surahdetail extends StatelessWidget {
  final SurahModel surahdetail;
  const Surahdetail({super.key, required this.surahdetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            Text(
              "${surahdetail.englishName}",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Surahdetailbody(
          surah: surahdetail,
        ),
      ),
    );
  }
}
