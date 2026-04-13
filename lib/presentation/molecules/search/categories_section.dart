import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hadist_pedia/presentation/atom/shared/chip.dart';

class SearchCategoriesSection extends StatelessWidget {
  final List<Map<String, dynamic>> categories;

  const SearchCategoriesSection({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    if (categories.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Categories',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'See All',
              style: TextStyle(
                color: const Color(0xFFD4E99C),
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Wrap(
          spacing: 10,
          runSpacing: 12,
          children: categories.map((cat) {
            return GestureDetector(
              onTap: () {
                final route = cat['targetType'] == 'book' ? '/book' : '/hadist';
                context.push(route, extra: {
                  'index': cat['index'],
                  'jsonPath': cat['jsonPath'],
                });
              },
              child: CategoryChip(label: cat['title'], isSelected: false),
            );
          }).toList(),
        ),
      ],
    );
  }
}
