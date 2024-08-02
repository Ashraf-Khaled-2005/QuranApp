import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/Router.dart';
import 'package:quran/core/constant.dart';
import 'package:quran/features/home/data/repo/Home_repo_impl.dart';
import 'package:quran/features/home/presentation/manager/Fetchindex/fetchindex_cubit.dart';
import 'package:quran/features/home/presentation/manager/Futchsurascubit/fetch_surahs_cubit.dart';
import 'package:quran/features/home/presentation/manager/savedindex/save_index_lastread_cubit.dart';

import 'core/api_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                FetchSurahsCubit(HomeRepoImpl(apiService: ApiService(Dio())))
                  ..Fetchsurahs()),
        BlocProvider(create: (context) => SaveIndexLastreadCubit()),
        BlocProvider(create: (context) => FetchindexCubit()..FetchIndex()),
      ],
      child: MaterialApp.router(
        routerConfig: Approuter.router,
        theme: ThemeData(scaffoldBackgroundColor: scaffoldDark),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
