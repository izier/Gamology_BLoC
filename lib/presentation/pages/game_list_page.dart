import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamology_bloc/common/constants.dart';
import 'package:gamology_bloc/presentation/bloc/game_list/list_bloc.dart';
import 'package:gamology_bloc/presentation/bloc/game_list/list_event.dart';
import 'package:gamology_bloc/presentation/bloc/game_list/list_state.dart';
import 'package:gamology_bloc/presentation/pages/game_search_page.dart';
import 'package:gamology_bloc/presentation/widgets/game_card.dart';

class GameListPage extends StatefulWidget{
  const GameListPage({Key? key}) : super(key: key);

  @override
  State<GameListPage> createState() => _GameListPageState();
}

class _GameListPageState extends State<GameListPage> {
  int page = 1;
  bool isFirstPage = true;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ListBloc>(context, listen: false).add(GetGameListEvent(page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DarkTheme.scaffoldBackgroundColor,
        title: Text("Gamology", style: DarkTheme.logo),
        elevation: 0,
        actions: [
          IconButton(
            onPressed:() {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GameSearchPage())
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16,left: 8, right: 8),
        child: Column(
          children: [
            const Text('Top Picks', style: DarkTheme.headline1),
            const SizedBox(height: 8),
            const Text('Based on ratings and popularity'),
            const SizedBox(height: 8),
            BlocBuilder<ListBloc, ListState>(
              builder: (context, state) {
                if (state is ListInitial) {
                  context.read<ListBloc>().add(GetGameListEvent(page));
                } else if (state is ListLoading) {
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
                } else if (state is ListError) {
                  return Expanded(
                    child: Center(
                      child: Text(state.message),
                    ),
                  );
                } else if (state is ListHasData) {
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
                                    context.read<ListBloc>().add(GetGameListEvent(page));
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
                                    context.read<ListBloc>().add(GetGameListEvent(page));
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
      ),
    );
  }
}