import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:quran/features/home/data/repo/Home_repo_impl.dart';

import '../../view_model/surah_model/surah_model.dart';

part 'fetch_surahs_state.dart';

class FetchSurahsCubit extends Cubit<FetchSurahsState> {
  late List<SurahModel> tempsurahs;
  FetchSurahsCubit() : super(FetchSurahsInitial());
  Future<void> Fetchsurahs() async {
    emit(FetchSurahsLoading());
    try {
      List<SurahModel> surhs;
      surhs = await HomeRepoImpl().FetchAllSurah(dioo: Dio());
      tempsurahs = surhs;
      emit(FetchSurahssuccess(surahs: surhs));
    } on Exception catch (e) {
      emit(FetchSurahsfailure(err: e.toString()));
    }
  }
}
