import 'package:flutter/material.dart';
import 'package:gamology_bloc/common/constants.dart';
import 'package:gamology_bloc/domain/entities/game.dart';
import 'package:gamology_bloc/presentation/pages/game_detail_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gamology_bloc/presentation/widgets/add_platform_icons.dart';

class GameCard extends StatelessWidget {
  final Game game;

  const GameCard(this.game, {super.key});

  @override
  Widget build(BuildContext context) {
    String genres = '';
    for (int i = 0; i < game.genres.length; i++){
      if (i < game.genres.length - 1) {
        genres += '${game.genres[i].name}, ';
      } else {
        genres += game.genres[i].name;
      }
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GameDetailPage(screenshots: game.screenshots, id: game.id)),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: DarkTheme.cardColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                  child: CachedNetworkImage(
                    imageUrl: game.backgroundImage,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: (
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addPlatformIcons(game.platforms),
                      const SizedBox(height: 8),
                      Text(game.name ?? "unnamed game", style: DarkTheme.headline2),
                      const SizedBox(height: 8),
                      Text(genres),
                      const SizedBox(height: 16),
                      const Center(
                        child: Text("Read more", style: TextStyle(decoration: TextDecoration.underline)),
                      )
                    ],
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}