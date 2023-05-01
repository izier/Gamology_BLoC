import 'package:dartz/dartz.dart';
import 'package:gamology_bloc/common/failure.dart';
import 'package:gamology_bloc/domain/entities/news.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<News>>> getGameNewsList(int page);
}