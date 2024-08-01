import 'package:flutter/material.dart';
import 'package:quran/features/home/presentation/view_model/surah_model/surah_model.dart';

import 'surahlistviewdetail.dart';

class Surahdetailbody extends StatelessWidget {
  final SurahModel surah;
  const Surahdetailbody({super.key, required this.surah});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.sizeOf(context).height;
    var w = MediaQuery.sizeOf(context).width;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(children: [
            Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: w,
                  height: h * .35,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xffC683FC),
                          Color.fromARGB(255, 125, 65, 214)
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16)),
                ),
                Positioned(
                    top: 150,
                    child: SizedBox(
                        child: Text(
                      '_______________________________________________________________',
                      style: TextStyle(color: Colors.white),
                    ))),
                Positioned(
                  top: 50,
                  child: Text(
                    "${surah.englishName}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Positioned(
                  top: 230,
                  child: Text(
                    "${surah.revelationType} - ${surah.ayahs!.length} Ayat",
                    style: TextStyle(
                        color: Colors.white.withOpacity(.8), fontSize: 24),
                  ),
                ),
                Positioned(
                  bottom: -10,
                  child: Image.asset(
                    'assets/basmallah.png',
                    height: 200,
                    width: w * .7,
                  ),
                )
              ],
            ),
          ]),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 30,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: surah.ayahs!.length,
            (context, index) {
              return Surahview(
                ayahs: surah.ayahs![index],
                SavedSuarh: surah,
              );
            },
          ),
        )
      ],
    );
  }
}
