import 'package:equatable/equatable.dart';
import 'package:gamology_bloc/domain/entities/genre.dart';
import 'package:gamology_bloc/domain/entities/platform.dart';

class Game extends Equatable{
  const Game({
    required this.id,
    required this.name,
    required this.backgroundImage,
    required this.platforms,
    required this.genres,
    required this.screenshots,
  });
  final int id;
  final String? name;
  final String backgroundImage;
  final List<Platform> platforms;
  final List<Genre> genres;
  final List screenshots;

  @override
  List<Object?> get props => [
    id,
    name,
    backgroundImage,
    platforms,
    genres,
    screenshots,
  ];
}