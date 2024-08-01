import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/features/home/presentation/manager/Futchsurascubit/fetch_surahs_cubit.dart';

import 'containerhome.dart';
import 'suranlist.dart';

class Homebody extends StatelessWidget {
  const Homebody({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.sizeOf(context).height;
    var w = MediaQuery.sizeOf(context).width;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Text(
                "Assalamu'alaikum",
                style: TextStyle(
                    color: Colors.white.withOpacity(.5), fontSize: 24),
              ),
              Text('data'),
              const Text(
                "Ahln wa Sahlan 🙏",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomcontainerHome(w: w, h: h),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        BlocBuilder<FetchSurahsCubit, FetchSurahsState>(
          builder: (context, state) {
            if (state is FetchSurahssuccess) {
              return surah_list(surahs: state.surahs);
            } else if (state is FetchSurahsLoading) {
              return const SliverToBoxAdapter(
                child: Center(
                  child: const CircularProgressIndicator(),
                ),
              );
            } else {
              return const SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    "err",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            }
          },
        )
      ],
    );
  }
}
