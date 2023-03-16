import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamology_bloc/domain/usecases/get_game_list.dart';
import 'package:gamology_bloc/presentation/bloc/game_list/list_event.dart';
import 'package:gamology_bloc/presentation/bloc/game_list/list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  final GetGameList _getGameList;

  ListBloc(this._getGameList) : super(ListInitial()){
    on<GetGameListEvent>((event, emit) async {
      final page = event.page;

      emit(ListLoading());
      final result = await _getGameList.execute(page);

      result.fold(
              (failure) {
            emit(ListError(failure.message));
          },
              (result){
            emit(ListHasData(result));
          }
      );
    });
  }
}