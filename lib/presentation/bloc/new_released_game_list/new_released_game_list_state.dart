import 'package:equatable/equatable.dart';
import 'package:gamology_bloc/domain/entities/game.dart';

abstract class NewReleasedGameListState extends Equatable {
  const NewReleasedGameListState();

  @override
  List<Object> get props => [];
}

class NewReleasedGameListInitial extends NewReleasedGameListState {}

class NewReleasedGameListLoading extends NewReleasedGameListState {}

class NewReleasedGameListError extends NewReleasedGameListState {
  final String message;

  const NewReleasedGameListError(this.message);

  @override
  List<Object> get props => [];
}

class NewReleasedGameListHasData extends NewReleasedGameListState {
  final List<Game> result;

  const NewReleasedGameListHasData(this.result);

  @override
  List<Object> get props => [];
}