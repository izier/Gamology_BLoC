import 'package:equatable/equatable.dart';

abstract class GameNewsListEvent extends Equatable {
  const GameNewsListEvent();

  @override
  List<Object> get props => [];
}

class GetGameNewsListEvent extends GameNewsListEvent {
  final int page;

  const GetGameNewsListEvent(this.page);

  @override
  List<Object> get props => [];
}