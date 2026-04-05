import 'package:flutter/material.dart';
import '../../utils/app_sizes.dart';
import '../molecules/hadist_card_item.dart';

class HadistCollectionRow extends StatelessWidget {
  final List<Map<String, String>> items;

  const HadistCollectionRow({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingXl),
      child: Row(
        children: items.map((item) {
          return Padding(
            padding: EdgeInsets.only(right: AppSizes.hadistCardSpacing),
            child: HadistCardItem(
              title: item['title'] ?? '',
              description: item['description'] ?? '',
            ),
          );
        }).toList(),
      ),
    );
  }
}
