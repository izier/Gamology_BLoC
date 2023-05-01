import 'package:equatable/equatable.dart';

abstract class TopRatedGameListEvent extends Equatable {
  const TopRatedGameListEvent();

  @override
  List<Object> get props => [];
}

class GetTopRatedGameListEvent extends TopRatedGameListEvent {
  final int page;

  const GetTopRatedGameListEvent(this.page);

  @override
  List<Object> get props => [];
}