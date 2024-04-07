part of 'surah_bloc.dart';

@immutable
sealed class SurahState {}

final class SurahInitial extends SurahState {}

final class SurahStateLoading extends SurahState {}

class SurahStateSuccess extends SurahState {
  final List<Datum> list;
  SurahStateSuccess(this.list);
  List<Object> get props => [list];
}

final class SurahStateFailed extends SurahState {
  final String error;
  SurahStateFailed({required this.error});
}
