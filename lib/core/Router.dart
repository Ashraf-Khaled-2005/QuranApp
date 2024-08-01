import 'package:go_router/go_router.dart';
import 'package:quran/features/favuriteayat/presentation/views/favuritepage.dart';
import 'package:quran/features/home/presentation/view_model/surah_model/surah_model.dart';
import 'package:quran/features/home/presentation/views/Home_view.dart';
import 'package:quran/features/splash/presentation/views/Splashscreen.dart';
import 'package:quran/features/surahdetail/presentation/views/Surahdetail.dart';

class Approuter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: '/favurite',
        builder: (context, state) => Favuritepage(),
      ),
      GoRoute(
        path: '/detail',
        builder: (context, state) {
          final SurahModel surah = state.extra as SurahModel;
          return Surahdetail(
            surahdetail: surah,
          );
        },
      ),
    ],
  );
}
