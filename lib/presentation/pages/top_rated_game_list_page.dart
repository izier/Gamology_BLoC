import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamology_bloc/common/constants.dart';
import 'package:gamology_bloc/presentation/bloc/top_rated_game_list/top_rated_game_list_bloc.dart';
import 'package:gamology_bloc/presentation/bloc/top_rated_game_list/top_rated_game_list_event.dart';
import 'package:gamology_bloc/presentation/bloc/top_rated_game_list/top_rated_game_list_state.dart';
import 'package:gamology_bloc/presentation/widgets/game_card.dart';

class TopRatedGameListPage extends StatefulWidget{
  const TopRatedGameListPage({Key? key}) : super(key: key);

  @override
  State<TopRatedGameListPage> createState() => _TopRatedGameListPageState();
}

class _TopRatedGameListPageState extends State<TopRatedGameListPage> {
  int page = 1;
  bool isFirstPage = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16,left: 8, right: 8),
      child: Column(
        children: [
          const Text('Top Rated Games', style: DarkTheme.headline1),
          const SizedBox(height: 8),
          const Text('Based on Metacritic ratings'),
          const SizedBox(height: 8),
          BlocBuilder<TopRatedGameListBloc, TopRatedGameListState>(
            builder: (context, state) {
              if (state is TopRatedGameListInitial) {
                BlocProvider.of<TopRatedGameListBloc>(context, listen: false).add(GetTopRatedGameListEvent(page));
              } else if (state is TopRatedGameListLoading) {
                if (page == 1) {
                  isFirstPage = true;
                } else {
                  isFirstPage = false;
                }
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (state is TopRatedGameListError) {
                return Expanded(
                  child: Center(
                    child: Text(state.message),
                  ),
                );
              } else if (state is TopRatedGameListHasData) {
                final result = state.result;
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      if (index < 15) {
                        final game = result[index];
                        return GameCard(game);
                      }
                      return SizedBox(
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            isFirstPage ? Container() : Container(
                              height: 32,
                              width: 32,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                color: DarkTheme.buttonColor,
                              ),
                              child: InkWell(
                                onTap: () {
                                  page--;
                                  context.read<TopRatedGameListBloc>().add(GetTopRatedGameListEvent(page));
                                },
                                child: const Center(child: Text("<<")),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Text("Page $page"),
                            const SizedBox(width: 16),
                            Container(
                              height: 32,
                              width: 32,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                color: DarkTheme.buttonColor,
                              ),
                              child: InkWell(
                                onTap: () {
                                  page++;
                                  context.read<TopRatedGameListBloc>().add(GetTopRatedGameListEvent(page));
                                },
                                child: const Center(child: Text(">>")),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: 16,
                  ),
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}