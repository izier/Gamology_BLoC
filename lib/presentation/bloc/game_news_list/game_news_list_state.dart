import 'package:equatable/equatable.dart';
import 'package:gamology_bloc/domain/entities/news.dart';

abstract class GameNewsListState extends Equatable {
  const GameNewsListState();

  @override
  List<Object> get props => [];
}

class GameNewsListInitial extends GameNewsListState {}

class GameNewsListLoading extends GameNewsListState {}

class GameNewsListError extends GameNewsListState {
  final String message;

  const GameNewsListError(this.message);

  @override
  List<Object> get props => [];
}

class GameNewsListHasData extends GameNewsListState {
  final List<News> result;

  const GameNewsListHasData(this.result);

  @override
  List<Object> get props => [];
}