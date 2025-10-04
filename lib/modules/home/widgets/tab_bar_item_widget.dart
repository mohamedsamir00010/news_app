import 'package:flutter/material.dart';
import 'package:news_app_c15_mon/modules/home/model/source_data.dart';

class TabBarItemWidget extends StatelessWidget {
  final SourceData sourceData;
  const TabBarItemWidget({super.key, required this.sourceData, required bool isSelected});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Text(sourceData.name, style: theme.textTheme.titleSmall);
  }
}
