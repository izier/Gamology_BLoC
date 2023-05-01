import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamology_bloc/common/constants.dart';
import 'package:gamology_bloc/presentation/bloc/search_game/search_bloc.dart';
import 'package:gamology_bloc/presentation/bloc/search_game/search_event.dart';
import 'package:gamology_bloc/presentation/bloc/search_game/search_state.dart';
import 'package:gamology_bloc/presentation/widgets/game_card.dart';

class GameSearchPage extends StatelessWidget{
  const GameSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Search'),
        elevation: 0,
        backgroundColor: DarkTheme.scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 24, left: 8, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (query) {
                context.read<SearchBloc>().add(OnQueryChanged(query));
              },
              decoration: const InputDecoration(
                hintText: 'Search game',
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.white,
                border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
              ),
              textInputAction: TextInputAction.search,
            ),
            const SizedBox(
              height: 8,
            ),
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (state is SearchError) {
                  return Expanded(
                    child: Center(
                      child: Text(state.message),
                    ),
                  );
                } else if (state is SearchHasData) {
                  final result = state.result;
                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        final game = result[index];
                        return GameCard(game);
                      },
                      itemCount: result.length,
                    ),
                  );
                } else {
                  return const Expanded(child: Center(child: Text('Start a search', style: TextStyle(fontSize: 20))));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}