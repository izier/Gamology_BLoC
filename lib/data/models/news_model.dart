import 'package:equatable/equatable.dart';
import 'package:gamology_bloc/domain/entities/news.dart';

class NewsModel extends Equatable{
  const NewsModel({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
  });
  final String source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
    source: json["source"]["name"] ?? '',
    author: json["author"] ?? '',
    title: json["title"] ?? '',
    description: json["description"] ?? '',
    url: json["url"] ?? '',
    urlToImage: json["urlToImage"] ?? 'https://t4.ftcdn.net/jpg/04/99/93/31/360_F_499933117_ZAUBfv3P1HEOsZDrnkbNCt4jc3AodArl.jpg',
  );

  News toEntity() {
    return News(
      source: source,
      author: author,
      title: title,
      description: description,
      url: url,
      urlToImage: urlToImage,
    );
  }

  @override
  List<Object?> get props => [
    source,
    author,
    title,
    description,
    url,
    urlToImage,
  ];
}