part of 'fetch_surahs_cubit.dart';

sealed class FetchSurahsState {}

final class FetchSurahsInitial extends FetchSurahsState {}

final class FetchSurahsLoading extends FetchSurahsState {}

final class FetchSurahsfailure extends FetchSurahsState {
  final String err;

  FetchSurahsfailure({required this.err});
}

final class FetchSurahssuccess extends FetchSurahsState {
  final List<SurahModel> surahs;

  FetchSurahssuccess({required this.surahs});
}
