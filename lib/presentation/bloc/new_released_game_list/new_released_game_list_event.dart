import 'package:equatable/equatable.dart';

abstract class NewReleasedGameListEvent extends Equatable {
  const NewReleasedGameListEvent();

  @override
  List<Object> get props => [];
}

class GetNewReleasedGameListEvent extends NewReleasedGameListEvent {
  final int page;

  const GetNewReleasedGameListEvent(this.page);

  @override
  List<Object> get props => [];
}