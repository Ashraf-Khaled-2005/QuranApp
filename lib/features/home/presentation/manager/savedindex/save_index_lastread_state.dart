part of 'save_index_lastread_cubit.dart';

@immutable
sealed class SaveIndexLastreadState {}

final class SaveIndexLastreadInitial extends SaveIndexLastreadState {}

final class SaveIndexLastreadloading extends SaveIndexLastreadState {}

final class SaveIndexLastreadsuccess extends SaveIndexLastreadState {}
