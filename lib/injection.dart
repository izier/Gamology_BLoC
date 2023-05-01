import 'package:gamology_bloc/data/datasources/game_data_source.dart';
import 'package:gamology_bloc/data/datasources/news_data_source.dart';
import 'package:gamology_bloc/data/repositories/game_repository.dart';
import 'package:gamology_bloc/data/repositories/news_repository.dart';
import 'package:gamology_bloc/domain/repositories/game_repository.dart';
import 'package:gamology_bloc/domain/repositories/news_repository.dart';
import 'package:gamology_bloc/domain/usecases/get_game_detail.dart';
import 'package:gamology_bloc/domain/usecases/get_game_news_list.dart';
import 'package:gamology_bloc/domain/usecases/get_new_released_game_list.dart';
import 'package:gamology_bloc/domain/usecases/get_popular_game_list.dart';
import 'package:gamology_bloc/domain/usecases/get_top_rated_game_list.dart';
import 'package:gamology_bloc/domain/usecases/search_game.dart';
import 'package:gamology_bloc/presentation/bloc/game_detail/detail_bloc.dart';
import 'package:gamology_bloc/presentation/bloc/game_news_list/game_news_list_bloc.dart';
import 'package:gamology_bloc/presentation/bloc/new_released_game_list/new_released_game_list_bloc.dart';
import 'package:gamology_bloc/presentation/bloc/popular_game_list/popular_game_list_bloc.dart';
import 'package:gamology_bloc/presentation/bloc/search_game/search_bloc.dart';
import 'package:gamology_bloc/presentation/bloc/top_rated_game_list/top_rated_game_list_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => SearchBloc(locator()));
  locator.registerFactory(() => PopularGameListBloc(locator()));
  locator.registerFactory(() => TopRatedGameListBloc(locator()));
  locator.registerFactory(() => NewReleasedGameListBloc(locator()));
  locator.registerFactory(() => DetailBloc(locator()));
  locator.registerFactory(() => GameNewsListBloc(locator()));

  // use case
  locator.registerLazySingleton(() => SearchGame(repository: locator()));
  locator.registerLazySingleton(() => GetPopularGameList(repository: locator()));
  locator.registerLazySingleton(() => GetTopRatedGameList(repository: locator()));
  locator.registerLazySingleton(() => GetNewReleasedGameList(repository: locator()));
  locator.registerLazySingleton(() => GetGameDetail(repository: locator()));
  locator.registerLazySingleton(() => GetGameNewsList(repository: locator()));

  // repository
  locator.registerLazySingleton<GameRepository>(() => GameRepositoryImpl(dataSource: locator()));
  locator.registerLazySingleton<NewsRepository>(() => NewsRepositoryImpl(dataSource: locator()));

  // data source
  locator.registerLazySingleton<GameDataSource>(() => GameDataSourceImpl(client: locator()));
  locator.registerLazySingleton<NewsDataSource>(() => NewsDataSourceImpl(client: locator()));

  // external
  locator.registerLazySingleton(() => http.Client());
}