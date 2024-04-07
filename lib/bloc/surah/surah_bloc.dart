import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ngaos_app/data/model/response_surah.dart';
import 'package:ngaos_app/data/service.dart';

part 'surah_event.dart';
part 'surah_state.dart';

class SurahBloc extends Bloc<SurahEvent, SurahState> {
  Service service = Service();
  SurahBloc() : super(SurahInitial()) {
    on<SurahEvent>((event, emit) async {
      if (event is SurahEventGet) {
        try {
          emit(SurahStateLoading());
          final data = await service.getListSurah();
          emit(SurahStateSuccess(data));
        } catch (e) {
          emit(SurahStateFailed(error: e.toString()));
        }
      }
    });
  }

  Stream<SurahState> streamSurah() async* {
    try {
      final data = await service.getListSurah();
      yield SurahStateSuccess(data);
    } catch (e) {
      yield SurahStateFailed(error: e.toString());
    }
  }
}
