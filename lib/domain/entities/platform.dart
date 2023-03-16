import 'package:equatable/equatable.dart';
import 'package:gamology_bloc/domain/entities/requirements.dart';

class Platform extends Equatable{
  const Platform({
    required this.id,
    required this.name,
    required this.requirements,
  });
  final int id;
  final String name;
  final Requirements? requirements;

  @override
  List<Object?> get props => [
    id,
    name,
    requirements,
  ];
}