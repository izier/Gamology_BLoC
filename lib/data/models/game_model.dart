import 'package:equatable/equatable.dart';
import 'package:gamology_bloc/data/models/genre_model.dart';
import 'package:gamology_bloc/data/models/platform_model.dart';
import 'package:gamology_bloc/domain/entities/game.dart';

class GameModel extends Equatable{
  const GameModel({
    required this.name,
    required this.id,
    required this.backgroundImage,
    required this.platforms,
    required this.genres,
    required this.screenshots
  });
  final int id;
  final String name;
  final String backgroundImage;
  final List<PlatformModel>? platforms;
  final List<GenreModel> genres;
  final List screenshots;

  factory GameModel.fromJson(Map<String, dynamic> json) => GameModel(
    id: json["id"],
    name: json["name"],
    backgroundImage: json["background_image"] ?? 'https://t4.ftcdn.net/jpg/04/99/93/31/360_F_499933117_ZAUBfv3P1HEOsZDrnkbNCt4jc3AodArl.jpg',
    platforms: json["platforms"] != null ? List<PlatformModel>.from(
      json["platforms"].map((x) => PlatformModel.fromJson(x))
    ) : [],
    genres: List<GenreModel>.from(
      json["genres"].map((x) => GenreModel.fromJson(x))
    ),
    screenshots: json["short_screenshots"] != null ? json["short_screenshots"].map((e) => e["image"]).toList() : ['https://t4.ftcdn.net/jpg/04/99/93/31/360_F_499933117_ZAUBfv3P1HEOsZDrnkbNCt4jc3AodArl.jpg'],
  );

  Game toEntity() {
    return Game(
      id: id,
      name: name,
      backgroundImage: backgroundImage,
      platforms: platforms!.map((platform) => platform.toEntity()).toList(),
      genres: genres.map((genre) => genre.toEntity()).toList(),
      screenshots: screenshots!,
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    backgroundImage,
    platforms,
    genres,
    screenshots
  ];
}
