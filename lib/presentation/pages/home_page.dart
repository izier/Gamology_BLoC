import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamology_bloc/common/constants.dart';
import 'package:gamology_bloc/presentation/bloc/new_released_game_list/new_released_game_list_bloc.dart';
import 'package:gamology_bloc/presentation/bloc/new_released_game_list/new_released_game_list_event.dart';
import 'package:gamology_bloc/presentation/bloc/new_released_game_list/new_released_game_list_state.dart';
import 'package:gamology_bloc/presentation/bloc/popular_game_list/popular_game_list_bloc.dart';
import 'package:gamology_bloc/presentation/bloc/popular_game_list/popular_game_list_event.dart';
import 'package:gamology_bloc/presentation/bloc/popular_game_list/popular_game_list_state.dart';
import 'package:gamology_bloc/presentation/bloc/top_rated_game_list/top_rated_game_list_bloc.dart';
import 'package:gamology_bloc/presentation/bloc/top_rated_game_list/top_rated_game_list_event.dart';
import 'package:gamology_bloc/presentation/bloc/top_rated_game_list/top_rated_game_list_state.dart';
import 'package:gamology_bloc/presentation/widgets/home_game_card.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            const Text('Popular Games', style: DarkTheme.headline2),
            const SizedBox(height: 8),
            BlocBuilder<PopularGameListBloc, PopularGameListState>(
              builder: (context, state) {
                if (state is PopularGameListInitial) {
                  BlocProvider.of<PopularGameListBloc>(context).add(const GetPopularGameListEvent(1));
                } else if (state is PopularGameListLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is PopularGameListError) {
                  return Center(
                    child: Text(state.message),
                  );
                } else if (state is PopularGameListHasData) {
                  final result = state.result;
                  return SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final game = result[index];
                        return HomeGameCard(game);
                      },
                      itemCount: 15,
                    ),
                  );
                }
                return Container();
              },
            ),
            const Text('Top Rated Games', style: DarkTheme.headline2),
            const SizedBox(height: 8),
            BlocBuilder<TopRatedGameListBloc, TopRatedGameListState>(
              builder: (context, state) {
                if (state is TopRatedGameListInitial) {
                  BlocProvider.of<TopRatedGameListBloc>(context).add(const GetTopRatedGameListEvent(1));
                } else if (state is PopularGameListLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is TopRatedGameListError) {
                  return Center(
                    child: Text(state.message),
                  );
                } else if (state is TopRatedGameListHasData) {
                  final result = state.result;
                  return SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final game = result[index];
                        return HomeGameCard(game);
                      },
                      itemCount: 15,
                    ),
                  );
                }
                return Container();
              },
            ),
            const Text('New Released Games', style: DarkTheme.headline2),
            const SizedBox(height: 8),
            BlocBuilder<NewReleasedGameListBloc, NewReleasedGameListState>(
              builder: (context, state) {
                if (state is NewReleasedGameListInitial) {
                  BlocProvider.of<NewReleasedGameListBloc>(context).add(const GetNewReleasedGameListEvent(1));
                } else if (state is PopularGameListLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is NewReleasedGameListError) {
                  return Center(
                    child: Text(state.message),
                  );
                } else if (state is NewReleasedGameListHasData) {
                  final result = state.result;
                  print('scenario 1 finished');
                  return SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final game = result[index];
                        return HomeGameCard(game);
                      },
                      itemCount: 15,
                    ),
                  );
                }
                return Container();
              },
            ),
          ],
        )
      ),
    );
  }
}