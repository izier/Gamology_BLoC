import 'package:equatable/equatable.dart';
import 'package:gamology_bloc/domain/entities/game.dart';

abstract class TopRatedGameListState extends Equatable {
  const TopRatedGameListState();

  @override
  List<Object> get props => [];
}

class TopRatedGameListInitial extends TopRatedGameListState {}

class TopRatedGameListLoading extends TopRatedGameListState {}

class TopRatedGameListError extends TopRatedGameListState {
  final String message;

  const TopRatedGameListError(this.message);

  @override
  List<Object> get props => [];
}

class TopRatedGameListHasData extends TopRatedGameListState {
  final List<Game> result;

  const TopRatedGameListHasData(this.result);

  @override
  List<Object> get props => [];
}