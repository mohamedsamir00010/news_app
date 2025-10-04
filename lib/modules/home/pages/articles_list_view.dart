import "package:flutter/material.dart";
import "package:news_app_c15_mon/modules/home/model/articles_list_data.dart";
import "package:news_app_c15_mon/modules/home/model/source_data.dart";
import "package:news_app_c15_mon/network/api_request.dart";

import "../widgets/article_item_widget.dart";

class ArticlesListView extends StatelessWidget {
  final SourceData sourceData;

  const ArticlesListView({super.key, required this.sourceData});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiRequest.getArticles(sourceData.id),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        List<Articles> articlesList = snapshot.data  ??[] ;

        return ListView.separated(
          itemBuilder: (context, int index) {
            return ArticleItemWidget( articles: articlesList[index],);
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 16);
          },
          itemCount: articlesList.length,
        );
      },
    );
  }
}
