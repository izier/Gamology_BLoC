import 'package:equatable/equatable.dart';
import 'package:gamology_bloc/data/models/game_model.dart';

class GameResponse extends Equatable {
  const GameResponse({required this.gameList});
  final List<GameModel> gameList;

  factory GameResponse.fromJson(Map<String, dynamic> json) => GameResponse(
    gameList: List<dynamic>.from(json["results"])
        .map((game) => GameModel.fromJson(game)).toList(),
  );

  @override
  List<Object?> get props => [gameList];
}