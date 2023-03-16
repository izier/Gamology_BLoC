import 'package:equatable/equatable.dart';
import 'package:gamology_bloc/domain/entities/game_detail.dart';

abstract class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

class DetailInitial extends DetailState {}

class DetailLoading extends DetailState {}

class DetailError extends DetailState {
  final String message;

  const DetailError(this.message);

  @override
  List<Object> get props => [];
}

class DetailHasData extends DetailState {
  final GameDetail result;

  const DetailHasData(this.result);

  @override
  List<Object> get props => [];
}