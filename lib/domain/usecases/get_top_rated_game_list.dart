import 'package:dartz/dartz.dart';
import 'package:gamology_bloc/common/failure.dart';
import 'package:gamology_bloc/domain/entities/game.dart';
import 'package:gamology_bloc/domain/repositories/game_repository.dart';

class GetTopRatedGameList {
  final GameRepository repository;

  GetTopRatedGameList({required this.repository});

  Future<Either<Failure, List<Game>>> execute(int page) {
    return repository.getTopRatedGameList(page);
  }
}