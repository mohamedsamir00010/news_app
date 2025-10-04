import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_c15_mon/modules/home/model/articles_list_data.dart';

class ArticleItemWidget extends StatelessWidget {
  final Articles articles ;

  const ArticleItemWidget({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black),
      ), // BoxDecoration
      child: Column(
          spacing: 10,
          children: [
            CachedNetworkImage(
              imageUrl: articles.urlToImage ?? '',
              imageBuilder: (context, imageProvider) =>
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                          colorFilter:
                          ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
                    ),
                  ),
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Text(
                articles.title ?? "",
                style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.black)), // Text
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    articles.source?.name ?? "",
                    style: theme.textTheme.titleMedium?.copyWith(
                        color: Color(0xFFA0A0A0))), // Text
                Text(
                    articles.publishedAt ?? "",
                    style: theme.textTheme.titleMedium?.copyWith(
                        color: Color(0xFFA0A0A0)))
              ],
            ),
          ]),
    );
  }
}