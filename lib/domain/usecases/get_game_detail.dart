import 'package:dartz/dartz.dart';
import 'package:gamology_bloc/common/failure.dart';
import 'package:gamology_bloc/domain/entities/game_detail.dart';
import 'package:gamology_bloc/domain/repositories/game_repository.dart';

class GetGameDetail {
  final GameRepository repository;

  GetGameDetail({required this.repository});

  Future<Either<Failure, GameDetail>> execute(int id) {
    return repository.getGameDetail(id);
  }
}