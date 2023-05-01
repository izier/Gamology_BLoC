import 'package:equatable/equatable.dart';
import 'package:gamology_bloc/data/models/genre_model.dart';
import 'package:gamology_bloc/data/models/developer_model.dart';
import 'package:gamology_bloc/data/models/publisher_model.dart';
import 'package:gamology_bloc/data/models/platform_model.dart';
import 'package:gamology_bloc/domain/entities/game_detail.dart';

class GameDetailModel extends Equatable{
  const GameDetailModel({
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
  final List<GenreModel> genres;
  final List<PlatformModel> platforms;
  final List<DeveloperModel> developers;
  final List<PublisherModel> publishers;

  factory GameDetailModel.fromJson(Map<String, dynamic> json) => GameDetailModel(
    id: json["id"],
    name: json["name"],
    released: json["released"] ?? 'No Data',
    description: json["description"],
    backgroundImage: json["background_image"] ?? 'https://t4.ftcdn.net/jpg/04/99/93/31/360_F_499933117_ZAUBfv3P1HEOsZDrnkbNCt4jc3AodArl.jpg',
    playtime: json["playtime"],
    genres: List<GenreModel>.from(
      json["genres"].map((x) => GenreModel.fromJson(x))
    ),
    platforms: List<PlatformModel>.from(
      json["platforms"].map((x) => PlatformModel.fromJson(x))
    ),
    developers: List<DeveloperModel>.from(
      json["developers"].map((x) => DeveloperModel.fromJson(x))
    ),
    publishers: List<PublisherModel>.from(
      json["publishers"].map((x) => PublisherModel.fromJson(x))
    ),
  );

  GameDetail toEntity() {
    return GameDetail(
      id: id,
      name: name,
      released: released,
      description: description,
      backgroundImage: backgroundImage,
      playtime: playtime,
      genres: genres.map((genre) => genre.toEntity()).toList(),
      platforms: platforms.map((platform) => platform.toEntity()).toList(),
      developers: developers.map((developer) => developer.toEntity()).toList(),
      publishers: publishers.map((publisher) => publisher.toEntity()).toList(),
    );
  }

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
