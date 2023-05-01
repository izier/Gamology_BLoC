import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamology_bloc/domain/usecases/get_new_released_game_list.dart';
import 'package:gamology_bloc/presentation/bloc/new_released_game_list/new_released_game_list_event.dart';
import 'package:gamology_bloc/presentation/bloc/new_released_game_list/new_released_game_list_state.dart';

class NewReleasedGameListBloc extends Bloc<NewReleasedGameListEvent, NewReleasedGameListState> {
  final GetNewReleasedGameList _getNewReleasedGameList;

  NewReleasedGameListBloc(this._getNewReleasedGameList) : super(NewReleasedGameListInitial()){
    on<GetNewReleasedGameListEvent>((event, emit) async {
      final page = event.page;

      emit(NewReleasedGameListLoading());
      final result = await _getNewReleasedGameList.execute(page);

      result.fold(
              (failure) {
            emit(NewReleasedGameListError(failure.message));
          },
              (result){
            emit(NewReleasedGameListHasData(result));
          }
      );
    });
  }
}