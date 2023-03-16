import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamology_bloc/common/constants.dart';
import 'package:gamology_bloc/injection.dart' as di;
import 'package:gamology_bloc/presentation/bloc/game_detail/detail_bloc.dart';
import 'package:gamology_bloc/presentation/bloc/game_list/list_bloc.dart';
import 'package:gamology_bloc/presentation/bloc/search_game/search_bloc.dart';
import 'package:gamology_bloc/presentation/pages/game_list_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.locator<SearchBloc>()),
        BlocProvider(create: (_) => di.locator<ListBloc>()),
        BlocProvider(create: (_) => di.locator<DetailBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gamology',
        theme: DarkTheme.themeData,
        home: const GameListPage(),
      ),
    );
  }
}