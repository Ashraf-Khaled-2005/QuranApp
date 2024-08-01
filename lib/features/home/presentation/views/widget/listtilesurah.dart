import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quran/features/home/presentation/manager/savedindex/save_index_lastread_cubit.dart';
import 'package:quran/features/home/presentation/view_model/surah_model/surah_model.dart';

import '../../../../../core/constant.dart';
import '../../manager/Fetchindex/fetchindex_cubit.dart';

class Listtilesurah extends StatelessWidget {
  final SurahModel surah;
  const Listtilesurah({super.key, required this.surah});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<SaveIndexLastreadCubit>(context)
            .SavedIndex(surah: surah);
        GoRouter.of(context).push('/detail', extra: surah);

        BlocProvider.of<FetchindexCubit>(context).FetchIndex();
      },
      child: ListTile(
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
                "${surah.number}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        title: Text(
          "${surah.englishName}",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        subtitle: Text(
          "${surah.revelationType} - ${surah.ayahs!.length} Ayat",
          style: TextStyle(color: Colors.white.withOpacity(.5), fontSize: 18),
        ),
        trailing: Text(
          "${surah.name}",
          style: TextStyle(color: kprimarycolor, fontSize: 24),
        ),
      ),
    );
  }
}
