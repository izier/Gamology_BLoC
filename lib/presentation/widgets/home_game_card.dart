import 'package:flutter/material.dart';
import 'package:gamology_bloc/common/constants.dart';
import 'package:gamology_bloc/domain/entities/game.dart';
import 'package:gamology_bloc/presentation/pages/game_detail_page.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeGameCard extends StatelessWidget {
  final Game game;

  const HomeGameCard(this.game, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GameDetailPage(screenshots: game.screenshots, id: game.id)),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 140,
                width: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: game.backgroundImage,
                    placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(game.name ?? "unnamed game", style: DarkTheme.headline3),
            ],
          ),
        ),
      ),
    );
  }
}