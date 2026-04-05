import 'package:flutter/material.dart';
import '../atoms/category_chip.dart';
import '../../utils/app_sizes.dart';

class CategoryChipBar extends StatelessWidget {
  final List<String> categories;
  final int selectedIndex;

  const CategoryChipBar({
    super.key,
    required this.categories,
    this.selectedIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: AppSizes.screenPadding,
      child: Row(
        children: List.generate(categories.length, (index) {
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 0 : AppSizes.paddingMd),
            child: CategoryChip(
              label: categories[index],
              isSelected: index == selectedIndex,
            ),
          );
        }),
      ),
    );
  }
}
