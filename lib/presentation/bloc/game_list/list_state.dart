import 'package:equatable/equatable.dart';
import 'package:gamology_bloc/domain/entities/game.dart';

abstract class ListState extends Equatable {
  const ListState();

  @override
  List<Object> get props => [];
}

class ListInitial extends ListState {}

class ListLoading extends ListState {}

class ListError extends ListState {
  final String message;

  const ListError(this.message);

  @override
  List<Object> get props => [];
}

class ListHasData extends ListState {
  final List<Game> result;

  const ListHasData(this.result);

  @override
  List<Object> get props => [];
}