part of 'ayat_bloc.dart';

@immutable
sealed class AyatEvent {}

class AyatEventAyatGet extends AyatEvent {
  final int surah;
  final int ayat;
  final int panjang;
  AyatEventAyatGet(this.surah, this.ayat, this.panjang);
}
