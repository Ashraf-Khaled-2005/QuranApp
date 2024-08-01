import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quran/features/home/presentation/view_model/surah_model/surah_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'save_index_lastread_state.dart';

class SaveIndexLastreadCubit extends Cubit<SaveIndexLastreadState> {
  SaveIndexLastreadCubit() : super(SaveIndexLastreadInitial());
  int? index = 1;

  Future<void> SavedIndex({required SurahModel surah}) async {
    emit(SaveIndexLastreadloading());
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('Name', surah.englishName!);
    await prefs.setString('Type', surah.revelationType!);
    await prefs.setInt('index', surah.ayahs!.length);

    emit(SaveIndexLastreadsuccess());
  }
}
