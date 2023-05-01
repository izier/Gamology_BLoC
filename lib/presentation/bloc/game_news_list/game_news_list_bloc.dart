import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamology_bloc/domain/usecases/get_game_news_list.dart';
import 'package:gamology_bloc/presentation/bloc/game_news_list/game_news_list_event.dart';
import 'package:gamology_bloc/presentation/bloc/game_news_list/game_news_list_state.dart';

class GameNewsListBloc extends Bloc<GameNewsListEvent, GameNewsListState> {
  final GetGameNewsList _getGameNewsList;

  GameNewsListBloc(this._getGameNewsList) : super(GameNewsListInitial()){
    on<GetGameNewsListEvent>((event, emit) async {
      final page = event.page;

      emit(GameNewsListLoading());
      final result = await _getGameNewsList.execute(page);

      result.fold(
              (failure) {
            emit(GameNewsListError(failure.message));
          },
              (result){
            emit(GameNewsListHasData(result));
          }
      );
    });
  }
}