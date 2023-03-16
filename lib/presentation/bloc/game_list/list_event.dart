import 'package:equatable/equatable.dart';

abstract class ListEvent extends Equatable {
  const ListEvent();

  @override
  List<Object> get props => [];
}

class GetGameListEvent extends ListEvent {
  final int page;

  const GetGameListEvent(this.page);

  @override
  List<Object> get props => [];
}