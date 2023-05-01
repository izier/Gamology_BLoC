import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamology_bloc/common/constants.dart';
import 'package:gamology_bloc/presentation/bloc/popular_game_list/popular_game_list_bloc.dart';
import 'package:gamology_bloc/presentation/bloc/popular_game_list/popular_game_list_event.dart';
import 'package:gamology_bloc/presentation/bloc/popular_game_list/popular_game_list_state.dart';
import 'package:gamology_bloc/presentation/widgets/game_card.dart';

class PopularGameListPage extends StatefulWidget{
  const PopularGameListPage({Key? key}) : super(key: key);

  @override
  State<PopularGameListPage> createState() => _PopularGameListPageState();
}

class _PopularGameListPageState extends State<PopularGameListPage> {
  int page = 1;
  bool isFirstPage = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16,left: 8, right: 8),
      child: Column(
        children: [
          const Text('Popular Games', style: DarkTheme.headline1),
          const SizedBox(height: 8),
          const Text('Based on ratings and popularity'),
          const SizedBox(height: 8),
          BlocBuilder<PopularGameListBloc, PopularGameListState>(
            builder: (context, state) {
              if (state is PopularGameListInitial) {
                BlocProvider.of<PopularGameListBloc>(context, listen: false).add(GetPopularGameListEvent(page));
              } else if (state is PopularGameListLoading) {
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
              } else if (state is PopularGameListError) {
                return Expanded(
                  child: Center(
                    child: Text(state.message),
                  ),
                );
              } else if (state is PopularGameListHasData) {
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
                                  context.read<PopularGameListBloc>().add(GetPopularGameListEvent(page));
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
                                  context.read<PopularGameListBloc>().add(GetPopularGameListEvent(page));
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