import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamology_bloc/common/constants.dart';
import 'package:gamology_bloc/presentation/bloc/game_news_list/game_news_list_bloc.dart';
import 'package:gamology_bloc/presentation/bloc/game_news_list/game_news_list_event.dart';
import 'package:gamology_bloc/presentation/bloc/game_news_list/game_news_list_state.dart';
import 'package:gamology_bloc/presentation/widgets/news_card.dart';

class NewsPage extends StatelessWidget{
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    print('start scenario 3');

    int page = 1;
    bool isFirstPage = true;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          const Text('Game News', style: DarkTheme.headline1),
          const SizedBox(height: 8),
          const Text('Hottest game news'),
          const SizedBox(height: 8),
          BlocBuilder<GameNewsListBloc, GameNewsListState>(
            builder: (context, state) {
              if (state is GameNewsListInitial) {
                context.read<GameNewsListBloc>().add(GetGameNewsListEvent(page));
              } else if (state is GameNewsListLoading) {
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
              } else if (state is GameNewsListError) {
                return Expanded(
                  child: Center(
                    child: Text(state.message, style: const TextStyle(color: Colors.white),),
                  ),
                );
              } else if (state is GameNewsListHasData) {
                final result = state.result;
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      if (index < 15) {
                        final news = result[index];
                        print('scenario 3 finished');
                        return NewsCard(news: news);
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
                                  context.read<GameNewsListBloc>().add(GetGameNewsListEvent(page));
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
                                  context.read<GameNewsListBloc>().add(GetGameNewsListEvent(page));
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