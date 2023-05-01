import 'package:equatable/equatable.dart';

class News extends Equatable{
  const News({
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