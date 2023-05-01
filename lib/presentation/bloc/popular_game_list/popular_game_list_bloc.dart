import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamology_bloc/domain/usecases/get_popular_game_list.dart';
import 'package:gamology_bloc/presentation/bloc/popular_game_list/popular_game_list_event.dart';
import 'package:gamology_bloc/presentation/bloc/popular_game_list/popular_game_list_state.dart';

class PopularGameListBloc extends Bloc<PopularGameListEvent, PopularGameListState> {
  final GetPopularGameList _getPopularGameList;

  PopularGameListBloc(this._getPopularGameList) : super(PopularGameListInitial()){
    on<GetPopularGameListEvent>((event, emit) async {
      final page = event.page;

      emit(PopularGameListLoading());
      final result = await _getPopularGameList.execute(page);

      result.fold(
              (failure) {
            emit(PopularGameListError(failure.message));
          },
              (result){
            emit(PopularGameListHasData(result));
          }
      );
    });
  }
}