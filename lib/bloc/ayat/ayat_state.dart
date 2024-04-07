part of 'ayat_bloc.dart';

@immutable
sealed class AyatState {}

final class AyatInitial extends AyatState {}

class AyatStateLoading extends AyatState {}

class AyatStateDetailSuccess extends AyatState {
  final List<Data> list;
  AyatStateDetailSuccess(this.list);
  List<Object> get props => [list];
}

final class AyatStateFailed extends AyatState {
  final String error;
  AyatStateFailed({required this.error});
}
