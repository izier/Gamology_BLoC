import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:gamology_bloc/common/exception.dart';
import 'package:gamology_bloc/common/failure.dart';
import 'package:gamology_bloc/data/datasources/news_data_source.dart';
import 'package:gamology_bloc/domain/entities/news.dart';
import 'package:gamology_bloc/domain/repositories/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsDataSource dataSource;

  NewsRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<News>>> getGameNewsList(int page) async {
    try {
      final result = await dataSource.getGameNewsList(page);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure("Failed to connect to the network"));
    }
  }
}