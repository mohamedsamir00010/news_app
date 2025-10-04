import 'package:flutter/material.dart';
import 'package:news_app_c15_mon/core/theme/color_pallete.dart';
import 'package:news_app_c15_mon/modules/home/model/category_data_model.dart';
import 'package:news_app_c15_mon/modules/home/model/source_data.dart';
import 'package:news_app_c15_mon/modules/home/pages/articles_list_view.dart';
import 'package:news_app_c15_mon/modules/home/widgets/tab_bar_item_widget.dart';
import 'package:news_app_c15_mon/network/api_request.dart';

class CategoryDetailsView extends StatefulWidget {
  final CategoryDataModel categoryDataModel;
  const CategoryDetailsView({super.key, required this.categoryDataModel});

  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {
  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<SourceData>>(
      future: ApiRequest.getSources(widget.categoryDataModel.id),
      builder: (
          BuildContext context,
          AsyncSnapshot<List<SourceData>> snapshot,
          ) {
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        List<SourceData> sourcesList = snapshot.data ?? [];

        return DefaultTabController(
          length: sourcesList.length,
          child: Column(
            children: [
              TabBar(
                isScrollable: true,
                dividerColor: Colors.transparent,
                indicatorColor: ColorPallete.generalTextColor,
                tabs: sourcesList.map((SourceData element) {
                  return TabBarItemWidget(
                    sourceData: element,
                    isSelected: false, //
                  );
                }).toList(),
              ),

              Expanded(
                child: TabBarView(
                  children: sourcesList.map((SourceData source) {
                    return ArticlesListView(sourceData: source);
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}