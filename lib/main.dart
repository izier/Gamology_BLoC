import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamology_bloc/common/constants.dart';
import 'package:gamology_bloc/injection.dart' as di;
import 'package:gamology_bloc/presentation/bloc/game_detail/detail_bloc.dart';
import 'package:gamology_bloc/presentation/bloc/game_news_list/game_news_list_bloc.dart';
import 'package:gamology_bloc/presentation/bloc/new_released_game_list/new_released_game_list_bloc.dart';
import 'package:gamology_bloc/presentation/bloc/popular_game_list/popular_game_list_bloc.dart';
import 'package:gamology_bloc/presentation/bloc/search_game/search_bloc.dart';
import 'package:gamology_bloc/presentation/bloc/top_rated_game_list/top_rated_game_list_bloc.dart';
import 'package:gamology_bloc/presentation/pages/main_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('start scenario 1');
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.locator<SearchBloc>()),
        BlocProvider(create: (_) => di.locator<PopularGameListBloc>()),
        BlocProvider(create: (_) => di.locator<TopRatedGameListBloc>()),
        BlocProvider(create: (_) => di.locator<NewReleasedGameListBloc>()),
        BlocProvider(create: (_) => di.locator<DetailBloc>()),
        BlocProvider(create: (_) => di.locator<GameNewsListBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gamology',
        theme: DarkTheme.themeData,
        home: const MainPage(),
      ),
    );
  }
}