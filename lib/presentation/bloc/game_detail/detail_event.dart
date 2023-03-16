import 'package:equatable/equatable.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class GetGameDetailEvent extends DetailEvent {
  final int id;

  const GetGameDetailEvent(this.id);

  @override
  List<Object> get props => [];
}