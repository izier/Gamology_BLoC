import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamology_bloc/domain/usecases/get_game_detail.dart';
import 'package:gamology_bloc/presentation/bloc/game_detail/detail_event.dart';
import 'package:gamology_bloc/presentation/bloc/game_detail/detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final GetGameDetail _getGameDetail;

  DetailBloc(this._getGameDetail) : super(DetailInitial()){
    on<GetGameDetailEvent>((event, emit) async {
      final id = event.id;

      emit(DetailLoading());
      final result = await _getGameDetail.execute(id);

      result.fold(
              (failure) {
            emit(DetailError(failure.message));
          },
              (result){
            emit(DetailHasData(result));
          }
      );
    });
  }
}