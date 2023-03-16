import 'dart:convert';
import 'package:gamology_bloc/common/exception.dart';
import 'package:gamology_bloc/data/models/game_detail_model.dart';
import 'package:gamology_bloc/data/models/game_model.dart';
import 'package:gamology_bloc/data/models/game_response.dart';
import 'package:http/http.dart' as http;

abstract class GameDataSource {
  Future<List<GameModel>> getGameList(int page);
  Future<List<GameModel>> searchGame(String query);
  Future<GameDetailModel> getGameDetail(int id);
}

class GameDataSourceImpl implements GameDataSource {
  static const apiKey = "bfc324abd5744971b5019694d16fe07e";
  static const baseUrl = "https://api.rawg.io/api";

  final http.Client client;

  GameDataSourceImpl({required this.client});

  @override
  Future<List<GameModel>> getGameList(int page) async {
    final response = await client.get(
      Uri.parse("$baseUrl/games?page_size=15&page=$page&key=$apiKey"),
    );

    if (response.statusCode != 200) {
      throw ServerException();
    }
    return GameResponse.fromJson(json.decode(response.body)).gameList;
  }

  @override
  Future<List<GameModel>> searchGame(String query) async{
    final response = await client.get(
      Uri.parse("$baseUrl/games?search=$query&key=$apiKey"),
    );

    if (response.statusCode != 200) {
      throw ServerException();
    }
    return GameResponse.fromJson(json.decode(response.body)).gameList;
  }

  @override
  Future<GameDetailModel> getGameDetail(int id) async {
    final response = await client.get(
      Uri.parse("$baseUrl/games/$id?key=$apiKey"),
    );

    if (response.statusCode != 200) {
      throw ServerException();
    }
    return GameDetailModel.fromJson(json.decode(response.body));
  }
}