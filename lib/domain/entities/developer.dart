import 'package:equatable/equatable.dart';

class Developer extends Equatable{
  const Developer({
    required this.id,
    required this.name,
  });
  final int id;
  final String name;

  @override
  List<Object?> get props => [
    id,
    name,
  ];
}