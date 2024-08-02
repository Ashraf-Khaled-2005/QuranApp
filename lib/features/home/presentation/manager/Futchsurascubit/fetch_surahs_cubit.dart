import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/features/home/data/repo/Home_repo.dart';
import '../../view_model/surah_model/surah_model.dart';
part 'fetch_surahs_state.dart';

class FetchSurahsCubit extends Cubit<FetchSurahsState> {
  late List<SurahModel> tempsurahs;
  FetchSurahsCubit(this.homeRepo) : super(FetchSurahsInitial());
  final HomeRepo homeRepo;

  Future<void> Fetchsurahs() async {
    emit(FetchSurahsLoading());
    var result = await homeRepo.FetchAllSurah();
    result.fold(
      (fail) {
        emit(FetchSurahsfailure(err: fail.toString()));
      },
      (success) {
        emit(FetchSurahssuccess(surahs: success));
      },
    );
  }
}
