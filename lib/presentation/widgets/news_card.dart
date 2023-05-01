import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gamology_bloc/common/constants.dart';
import 'package:gamology_bloc/domain/entities/news.dart';
import 'package:gamology_bloc/presentation/pages/news_webview_page.dart';

class NewsCard extends StatelessWidget {
  final News news;

  const NewsCard({
    required this.news
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsWebViewPage(url: news.url),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 120,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: news.urlToImage,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text(
                    news.title,
                    style: DarkTheme.headline3,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text("${news.author} | ${news.source}", style: DarkTheme.bodyText2),
                  const SizedBox(height: 4),
                  Text(
                    news.description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: DarkTheme.bodyText1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
