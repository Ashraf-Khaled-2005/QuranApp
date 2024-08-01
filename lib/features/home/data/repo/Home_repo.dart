import 'package:dio/dio.dart';
import 'package:quran/features/home/presentation/view_model/surah_model/surah_model.dart';

abstract class HomeRepo {
  Future<List<SurahModel>> FetchAllSurah({required Dio dioo});
}
