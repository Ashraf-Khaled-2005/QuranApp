import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quran/core/errors/failures.dart';
import 'package:quran/features/home/presentation/view_model/surah_model/surah_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<SurahModel>>> FetchAllSurah();
}
