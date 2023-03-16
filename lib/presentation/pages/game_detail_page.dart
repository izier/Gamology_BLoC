import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gamology_bloc/common/constants.dart';
import 'package:gamology_bloc/domain/entities/game_detail.dart';
import 'package:gamology_bloc/domain/entities/platform.dart';
import 'package:gamology_bloc/presentation/bloc/game_detail/detail_bloc.dart';
import 'package:gamology_bloc/presentation/bloc/game_detail/detail_event.dart';
import 'package:gamology_bloc/presentation/bloc/game_detail/detail_state.dart';
import 'package:gamology_bloc/presentation/widgets/add_platform_icons.dart';
import 'package:collection/collection.dart';

class GameDetailPage extends StatefulWidget{
  final List screenshots;
  final int id;

  const GameDetailPage({
    super.key,
    required this.screenshots,
    required this.id,
  });

  @override
  State<GameDetailPage> createState() => _GameDetailPageState();
}

class _GameDetailPageState extends State<GameDetailPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DetailBloc>(context, listen: false).add(GetGameDetailEvent(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DarkTheme.scaffoldBackgroundColor,
        title: const Text("Game Detail"),
        elevation: 0,
      ),
      body: BlocBuilder<DetailBloc, DetailState>(
        builder: (context, state) {
          if (state is DetailInitial) {
            context.read<DetailBloc>().add(GetGameDetailEvent(widget.id));
          } else if (state is DetailLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DetailError) {
            return Center(child: Text(state.message));
          } else if (state is DetailHasData) {
            return DetailContent(gameDetail: state.result, screenshots: widget.screenshots);
          }
          return Container();
        }
      ),
    );
  }
}

class DetailContent extends StatelessWidget {
  final GameDetail gameDetail;
  final List screenshots;

  const DetailContent({
    super.key,
    required this.gameDetail,
    required this.screenshots,
  });

  @override
  Widget build(BuildContext context) {
    String publishers = '';
    String developers = '';
    String genres = '';
    String platforms = '';
    bool pcReq = false;
    Platform? platform = const Platform(id: 1, name: 'temp', requirements: null);

    if (gameDetail.platforms.isNotEmpty) {
      platform = gameDetail.platforms.firstWhereOrNull((element) => element.name == "PC");
      if (platform != null) {
        if (platform.requirements!.recommended != null) {
          pcReq = true;
        }
      }
    }

    for(int i = 0; i < gameDetail.publishers.length; i++) {
      if (i < gameDetail.publishers.length - 1) {
        publishers += '${gameDetail.publishers[i].name}, ';
      } else {
        publishers += gameDetail.publishers[i].name;
      }
    }
    for(int i = 0; i < gameDetail.developers.length; i++) {
      if (i < gameDetail.developers.length - 1) {
        developers += '${gameDetail.developers[i].name}, ';
      } else {
        developers += gameDetail.developers[i].name;
      }
    }
    for(int i = 0; i < gameDetail.genres.length; i++) {
      if (i < gameDetail.genres.length - 1) {
        genres += '${gameDetail.genres[i].name}, ';
      } else {
        genres += gameDetail.genres[i].name;
      }
    }
    for(int i = 0; i < gameDetail.platforms.length; i++) {
      if (i < gameDetail.platforms.length - 1) {
        platforms += '${gameDetail.platforms[i].name}, ';
      } else {
        platforms += gameDetail.platforms[i].name;
      }
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Text(gameDetail.name, style: DarkTheme.headline1)),
            const SizedBox(height: 8),
            Center(child: ClipRRect(borderRadius: BorderRadius.circular(8), child: CachedNetworkImage(imageUrl: gameDetail.backgroundImage))),
            const SizedBox(height: 8),
            Center(child: addPlatformIcons(gameDetail.platforms),),
            const SizedBox(height: 8),
            Center(child: Text("Playtime: ${gameDetail.playtime} hours")),
            const SizedBox(height: 16),
            const Text("About", style: DarkTheme.headline2),
            Html(data: gameDetail.description.replaceAll('â', "'")),
            const SizedBox(height: 8),
            const Text("Screenshots", style: DarkTheme.headline2),
            const SizedBox(height: 8),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  String screenshot = screenshots[index].toString();
                  return Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                          imageUrl: screenshot,
                          placeholder:  (context, url) => const CircularProgressIndicator()
                        )
                      ),
                      index < screenshots.length - 1 ? const SizedBox(width: 8) : Container(),
                    ],
                  );
                }, itemCount: screenshots.length,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Release Date", style: DarkTheme.headline4),
                      Text(gameDetail.released),
                      const SizedBox(height: 8),
                      const Text("Genre", style: DarkTheme.headline4),
                      Text(genres),
                      const SizedBox(height: 8),
                      const Text("Platforms", style: DarkTheme.headline4),
                      Text(platforms),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Publisher", style: DarkTheme.headline4),
                      Text(publishers),
                      const SizedBox(height: 8),
                      const Text("Developer", style: DarkTheme.headline4),
                      Text(developers),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            pcReq ?
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('System Requirements for PC', style: DarkTheme.headline2),
                const SizedBox(height: 8),
                Text(platform!.requirements!.minimum!.replaceAll("Â®", "®")),
                const SizedBox(height: 8),
                Text(platform!.requirements!.recommended!.replaceAll("Â®", "®")),
              ],
            ) : Container(),
          ],
        ),
      ),
    );
  }}