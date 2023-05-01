import 'dart:convert';

import 'package:gamology_bloc/common/exception.dart';
import 'package:gamology_bloc/data/models/news_model.dart';
import 'package:gamology_bloc/data/models/news_response.dart';
import 'package:http/http.dart' as http;

abstract class NewsDataSource {
  Future<List<NewsModel>> getGameNewsList(int page);
}

class NewsDataSourceImpl implements NewsDataSource {
  static const apiKey = "ae8a97ef8ebc449ca2781e3c7adb0797";
  static const baseUrl = "https://newsapi.org/v2";

  final http.Client client;

  NewsDataSourceImpl({required this.client});

  @override
  Future<List<NewsModel>> getGameNewsList(int page) async {
    final response = await client.get(
      Uri.parse("$baseUrl/everything?q=game&page_size=15&page=$page&apiKey=$apiKey"),
    );

    if (response.statusCode != 200) {
      throw ServerException();
    }
    return NewsResponse.fromJson(json.decode(response.body)).newsList;
  }
}