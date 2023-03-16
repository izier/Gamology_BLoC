import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:gamology_bloc/common/failure.dart';
import 'package:gamology_bloc/common/exception.dart';
import 'package:gamology_bloc/data/datasources/game_data_source.dart';
import 'package:gamology_bloc/domain/entities/game.dart';
import 'package:gamology_bloc/domain/entities/game_detail.dart';
import 'package:gamology_bloc/domain/repositories/game_repository.dart';

class GameRepositoryImpl implements GameRepository {
  final GameDataSource dataSource;

  GameRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<Game>>> getGameList(int page) async {
    try {
      final result = await dataSource.getGameList(page);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure("Failed to connect to the network"));
    }
  }

  @override
  Future<Either<Failure, List<Game>>> searchGame(String query) async{
    try {
      final result = await dataSource.searchGame(query);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure("Failed to connect to the network"));
    }
  }

  @override
  Future<Either<Failure, GameDetail>> getGameDetail(int id) async {
    try {
      final result = await dataSource.getGameDetail(id);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure("Failed to connect to the network"));
    }
  }
}