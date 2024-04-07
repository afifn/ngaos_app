import 'package:bloc/bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:meta/meta.dart';
import 'package:ngaos_app/data/model/response_detail_surah.dart';
import 'package:ngaos_app/data/service.dart';

part 'ayat_event.dart';
part 'ayat_state.dart';

class AyatBloc extends Bloc<AyatEvent, AyatState> {
  final Service service = Service();

  final PagingController<int, String> _pagingController =
      PagingController(firstPageKey: 1);
  PagingController<int, String> get pagingController => _pagingController;

  AyatBloc() : super(AyatInitial()) {
    on<AyatEvent>((event, emit) async {
      if (event is AyatEventAyatGet) {
        try {
          emit(AyatStateLoading());
          final data = await service.getDetailSurah(
              event.surah, event.ayat, event.panjang);
          emit(AyatStateDetailSuccess(data));
        } catch (e) {
          emit(AyatStateFailed(error: e.toString()));
        }
      }
    });
  }
}
