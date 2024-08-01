part of 'fetchindex_cubit.dart';

abstract class FetchindexState {}

final class FetchindexInitial extends FetchindexState {}

final class Fetchindexloading extends FetchindexState {}

final class FetchIndexLastreadsuccess extends FetchindexState {
  final int ayatlength;
  final String name;
  final String type;

  FetchIndexLastreadsuccess(
      {required this.ayatlength, required this.name, required this.type});
}
