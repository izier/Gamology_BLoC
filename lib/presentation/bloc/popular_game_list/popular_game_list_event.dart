import 'package:equatable/equatable.dart';

abstract class PopularGameListEvent extends Equatable {
  const PopularGameListEvent();

  @override
  List<Object> get props => [];
}

class GetPopularGameListEvent extends PopularGameListEvent {
  final int page;

  const GetPopularGameListEvent(this.page);

  @override
  List<Object> get props => [];
}