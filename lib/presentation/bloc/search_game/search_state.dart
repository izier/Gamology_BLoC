import 'package:equatable/equatable.dart';
import 'package:gamology_bloc/domain/entities/game.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchError extends SearchState {
  final String message;

  const SearchError(this.message);

  @override
  List<Object> get props => [];
}

class SearchHasData extends SearchState {
  final List<Game> result;

  const SearchHasData(this.result);

  @override
  List<Object> get props => [];
}