import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:quran/features/home/data/repo/Home_repo.dart';
import 'package:quran/features/home/presentation/view_model/surah_model/surah_model.dart';

// ignore: camel_case_types
class HomeRepoImpl extends HomeRepo {
  @override
  Future<List<SurahModel>> FetchAllSurah({required Dio dioo}) async {
    final Dio dio = dioo;
    List<SurahModel> surahs = [];
    try {
      Response response =
          await dio.get('https://api.alquran.cloud/v1/quran/ar.alafasy');
      List<dynamic> data = response.data['data']['surahs'];
      for (int i = 0; i < data.length; i++) {
        SurahModel model = SurahModel.fromJson(data[i]);
        surahs.add(model);
      }
    } on DioException catch (e) {
      log('Dio error: $e');
    } catch (e) {
      log('Error: $e');
    }
    log('done');
    log('${surahs.length}');
    return surahs;
  }
}
