import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quran/core/api_service.dart';
import 'package:quran/core/errors/failures.dart';
import 'package:quran/features/home/data/repo/Home_repo.dart';
import 'package:quran/features/home/presentation/view_model/surah_model/surah_model.dart';

// ignore: camel_case_types
class HomeRepoImpl extends HomeRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, List<SurahModel>>> FetchAllSurah() async {
    List<SurahModel> surahs = [];
    try {
      Map<String, dynamic> response = await ApiService(Dio())
          .get(endPoint: 'quran/ar.alafasy') as Map<String, dynamic>;
      List<dynamic> data = response['data']['surahs'];
      for (int i = 0; i < data.length; i++) {
        SurahModel model = SurahModel.fromJson(data[i]);
        surahs.add(model);
      }
      return right(surahs);
    } catch (e) {
      if (e is DioException) {
        left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }
}
