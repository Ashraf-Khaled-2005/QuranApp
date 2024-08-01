import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'fetchindex_state.dart';

class FetchindexCubit extends Cubit<FetchindexState> {
  FetchindexCubit() : super(FetchindexInitial());
  int? ayatlength;
  String? name;
  String? type;

  Future<void> FetchIndex() async {
    emit(Fetchindexloading());
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    ayatlength = prefs.getInt('index');
    name = prefs.getString('Name');
    type = prefs.getString('Type');

    emit(FetchIndexLastreadsuccess(
        ayatlength: ayatlength ?? 7,
        name: name ?? 'الفاتحة',
        type: type ?? 'meccan'));
  }
}
