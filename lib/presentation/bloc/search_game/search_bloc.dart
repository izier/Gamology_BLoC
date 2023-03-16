import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamology_bloc/domain/usecases/search_game.dart';
import 'package:gamology_bloc/presentation/bloc/search_game/search_event.dart';
import 'package:gamology_bloc/presentation/bloc/search_game/search_state.dart';
import 'package:rxdart/rxdart.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchGame _searchGame;

  SearchBloc(this._searchGame) : super(SearchInitial()){
    on<OnQueryChanged>((event, emit) async {
      final query = event.query;

      emit(SearchLoading());
      final result = await _searchGame.execute(query);

      result.fold(
              (failure) {
            emit(SearchError(failure.message));
          },
              (result){
            emit(SearchHasData(result));
          }
      );
    },transformer: debounce(const Duration(milliseconds: 1000)),
    );
  }

  EventTransformer<T> debounce<T> (Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}