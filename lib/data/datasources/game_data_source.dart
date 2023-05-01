import 'dart:convert';
import 'package:gamology_bloc/common/exception.dart';
import 'package:gamology_bloc/data/models/game_detail_model.dart';
import 'package:gamology_bloc/data/models/game_model.dart';
import 'package:gamology_bloc/data/models/game_response.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

abstract class GameDataSource {
  Future<List<GameModel>> getPopularGameList(int page);
  Future<List<GameModel>> getTopRatedGameList(int page);
  Future<List<GameModel>> getNewReleasedGameList(int page);
  Future<List<GameModel>> searchGame(String query);
  Future<GameDetailModel> getGameDetail(int id);
}

class GameDataSourceImpl implements GameDataSource {
  static const apiKey = "bfc324abd5744971b5019694d16fe07e";
  static const baseUrl = "https://api.rawg.io/api";

  final http.Client client;

  GameDataSourceImpl({required this.client});

  @override
  Future<List<GameModel>> getPopularGameList(int page) async {
    final response = await client.get(
      Uri.parse("$baseUrl/games?page_size=15&page=$page&key=$apiKey"),
    );

    if (response.statusCode != 200) {
      throw ServerException();
    }
    return GameResponse.fromJson(json.decode(response.body)).gameList;
  }

  @override
  Future<List<GameModel>> getTopRatedGameList(int page) async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);

    final response = await client.get(
      Uri.parse("$baseUrl/games?page_size=15&page=$page&dates=2000-01-01,$formattedDate&ordering=-metacritic&key=$apiKey"),
    );

    if (response.statusCode != 200) {
      throw ServerException();
    }
    return GameResponse.fromJson(json.decode(response.body)).gameList;
  }

  @override
  Future<List<GameModel>> getNewReleasedGameList(int page) async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);

    DateTime threeMonthsAgo = now.subtract(const Duration(days: 90));
    String formattedThreeMonthsAgo = DateFormat('yyyy-MM-dd').format(threeMonthsAgo);

    final response = await client.get(
      Uri.parse("$baseUrl/games?page_size=15&page=$page&dates=$formattedThreeMonthsAgo,$formattedDate&ordering=-metacritic&key=$apiKey"),
    );

    if (response.statusCode != 200) {
      throw ServerException();
    }
    return GameResponse.fromJson(json.decode(response.body)).gameList;
  }

  @override
  Future<List<GameModel>> searchGame(String query) async{
    final response = await client.get(
      Uri.parse("$baseUrl/games?search=$query&search_precise=1&key=$apiKey"),
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