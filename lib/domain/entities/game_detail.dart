import 'package:equatable/equatable.dart';
import 'package:gamology_bloc/domain/entities/genre.dart';
import 'package:gamology_bloc/domain/entities/developer.dart';
import 'package:gamology_bloc/domain/entities/publisher.dart';
import 'package:gamology_bloc/domain/entities/platform.dart';

class GameDetail extends Equatable{
  const GameDetail({
    required this.id,
    required this.name,
    required this.released,
    required this.description,
    required this.backgroundImage,
    required this.playtime,
    required this.genres,
    required this.platforms,
    required this.developers,
    required this.publishers,
  });
  final int id;
  final String name;
  final String released;
  final String description;
  final String backgroundImage;
  final int playtime;
  final List<Genre> genres;
  final List<Platform> platforms;
  final List<Developer> developers;
  final List<Publisher> publishers;

  @override
  List<Object?> get props => [
    id,
    name,
    released,
    description,
    backgroundImage,
    playtime,
    genres,
    platforms,
    developers,
    publishers,
  ];
}