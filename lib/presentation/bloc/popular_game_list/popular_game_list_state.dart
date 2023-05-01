import 'package:equatable/equatable.dart';
import 'package:gamology_bloc/domain/entities/game.dart';

abstract class PopularGameListState extends Equatable {
  const PopularGameListState();

  @override
  List<Object> get props => [];
}

class PopularGameListInitial extends PopularGameListState {}

class PopularGameListLoading extends PopularGameListState {}

class PopularGameListError extends PopularGameListState {
  final String message;

  const PopularGameListError(this.message);

  @override
  List<Object> get props => [];
}

class PopularGameListHasData extends PopularGameListState {
  final List<Game> result;

  const PopularGameListHasData(this.result);

  @override
  List<Object> get props => [];
}