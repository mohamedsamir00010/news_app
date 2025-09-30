
import 'package:flutter/material.dart';
import 'package:news_app_c15_mon/modules/home/model/category_data_model.dart';

class CategoryDetailsView extends StatelessWidget {
  final CategoryDataModel categoryDataModel ;
  const CategoryDetailsView({super.key, required this.categoryDataModel});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      DefaultTabController(length: 4, child: TabBar(tabs: []))
    ],);
  }
}


