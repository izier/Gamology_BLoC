import 'package:gamology_bloc/data/datasources/game_data_source.dart';
import 'package:gamology_bloc/data/repositories/game_repository.dart';
import 'package:gamology_bloc/domain/repositories/game_repository.dart';
import 'package:gamology_bloc/domain/usecases/get_game_detail.dart';
import 'package:gamology_bloc/domain/usecases/get_game_list.dart';
import 'package:gamology_bloc/domain/usecases/search_game.dart';
import 'package:gamology_bloc/presentation/bloc/game_detail/detail_bloc.dart';
import 'package:gamology_bloc/presentation/bloc/game_list/list_bloc.dart';
import 'package:gamology_bloc/presentation/bloc/search_game/search_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => SearchBloc(locator()));
  locator.registerFactory(() => ListBloc(locator()));
  locator.registerFactory(() => DetailBloc(locator()));

  // use case
  locator.registerLazySingleton(() => SearchGame(repository: locator()));
  locator.registerLazySingleton(() => GetGameList(repository: locator()));
  locator.registerLazySingleton(() => GetGameDetail(repository: locator()));

  // repository
  locator.registerLazySingleton<GameRepository>(() => GameRepositoryImpl(dataSource: locator()));

  // data source
  locator.registerLazySingleton<GameDataSource>(() => GameDataSourceImpl(client: locator()));

  // external
  locator.registerLazySingleton(() => http.Client());
}