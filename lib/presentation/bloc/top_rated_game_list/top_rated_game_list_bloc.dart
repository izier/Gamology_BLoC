import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamology_bloc/domain/usecases/get_top_rated_game_list.dart';
import 'package:gamology_bloc/presentation/bloc/top_rated_game_list/top_rated_game_list_event.dart';
import 'package:gamology_bloc/presentation/bloc/top_rated_game_list/top_rated_game_list_state.dart';

class TopRatedGameListBloc extends Bloc<TopRatedGameListEvent, TopRatedGameListState> {
  final GetTopRatedGameList _getTopRatedGameList;

  TopRatedGameListBloc(this._getTopRatedGameList) : super(TopRatedGameListInitial()){
    on<GetTopRatedGameListEvent>((event, emit) async {
      final page = event.page;

      emit(TopRatedGameListLoading());
      final result = await _getTopRatedGameList.execute(page);

      result.fold(
              (failure) {
            emit(TopRatedGameListError(failure.message));
          },
              (result){
            emit(TopRatedGameListHasData(result));
          }
      );
    });
  }
}