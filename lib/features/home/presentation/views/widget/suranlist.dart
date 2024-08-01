import 'package:flutter/material.dart';
import 'package:quran/features/home/presentation/view_model/surah_model/surah_model.dart';

import 'listtilesurah.dart';

class surah_list extends StatelessWidget {
  final List<SurahModel> surahs;
  const surah_list({
    super.key,
    required this.surahs,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      childCount: surahs.length,
      (context, index) {
        return Column(
          children: [Listtilesurah(surah: surahs[index]), Divider()],
        );
      },
    ));
  }
}
