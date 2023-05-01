import 'package:dartz/dartz.dart';
import 'package:gamology_bloc/common/failure.dart';
import 'package:gamology_bloc/domain/entities/game.dart';
import 'package:gamology_bloc/domain/entities/game_detail.dart';

abstract class GameRepository {
  Future<Either<Failure, List<Game>>> getPopularGameList(int page);
  Future<Either<Failure, List<Game>>> getTopRatedGameList(int page);
  Future<Either<Failure, List<Game>>> getNewReleasedGameList(int page);
  Future<Either<Failure, List<Game>>> searchGame(String query);
  Future<Either<Failure, GameDetail>> getGameDetail(int id);
}