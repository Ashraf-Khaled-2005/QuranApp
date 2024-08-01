import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/features/home/presentation/manager/Fetchindex/fetchindex_cubit.dart';
import 'package:quran/features/home/presentation/manager/Futchsurascubit/fetch_surahs_cubit.dart';
import 'package:quran/features/home/presentation/view_model/surah_model/surah_model.dart';

class CustomcontainerHome extends StatefulWidget {
  const CustomcontainerHome({
    super.key,
    required this.w,
    required this.h,
  });

  final double w;
  final double h;

  @override
  State<CustomcontainerHome> createState() => _CustomcontainerHomeState();
}

class _CustomcontainerHomeState extends State<CustomcontainerHome> {
  late int? index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchindexCubit, FetchindexState>(
      builder: (context, state) {
        if (state is Fetchindexloading) {
          return CircularProgressIndicator();
        } else if (state is FetchIndexLastreadsuccess) {
          return Stack(
            children: [
              Container(
                width: widget.w,
                height: widget.h * .2,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xffC683FC),
                        Color.fromARGB(255, 66, 62, 72)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(8)),
              ),
              Positioned(
                bottom: -65,
                right: -20,
                child: Image.asset(
                  'assets/quran.png',
                  width: 200,
                  height: 200,
                ),
              ),
              Positioned(
                left: 20,
                top: 15,
                child: Positioned(
                  top: 35,
                  left: 35,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icon_readme.png',
                        width: 50,
                        height: 50,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Last Read",
                        style: TextStyle(color: Colors.white, fontSize: 28),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${state.name}",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "${state.type} - ${state.ayatlength} Ayat",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      )
                    ],
                  ))
            ],
          );
        }

        return Text("eslam");
      },
    );
  }
}
