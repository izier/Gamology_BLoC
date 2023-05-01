import 'package:flutter/material.dart';
import 'package:gamology_bloc/common/constants.dart';
import 'package:gamology_bloc/presentation/pages/game_search_page.dart';
import 'package:gamology_bloc/presentation/pages/home_page.dart';
import 'package:gamology_bloc/presentation/pages/new_released_game_list_page.dart';
import 'package:gamology_bloc/presentation/pages/news_page.dart';
import 'package:gamology_bloc/presentation/pages/popular_game_list_page.dart';
import 'package:gamology_bloc/presentation/pages/top_rated_game_list_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List _children = [const HomePage(), const PopularGameListPage(), const TopRatedGameListPage(), const NewReleasedGameListPage(), const NewsPage()];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
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
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: DarkTheme.scaffoldBackgroundColor,
        selectedItemColor: Colors.white,
        selectedFontSize: 12,
        unselectedFontSize: 10,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 20),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star, size: 20),
            label: 'Popular',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, size: 20),
            label: 'Top Rated',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bolt, size: 20),
            label: 'New Release',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article, size: 20),
            label: 'News',
          ),
        ],
      ),
    );
  }
}