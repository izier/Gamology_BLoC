import 'package:equatable/equatable.dart';
import 'package:gamology_bloc/data/models/news_model.dart';

class NewsResponse extends Equatable {
  const NewsResponse({required this.newsList});
  final List<NewsModel> newsList;

  factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
    newsList: List<dynamic>.from(json["articles"])
        .map((news) => NewsModel.fromJson(news)).toList(),
  );

  @override
  List<Object?> get props => [newsList];
}