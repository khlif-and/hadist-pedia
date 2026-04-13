import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hadist_pedia/presentation/atom/shared/popular_search.dart';
import 'package:hadist_pedia/presentation/atom/shared/dot_separator.dart';

class TrendingSearchSection extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  const TrendingSearchSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    List<Widget> children = [];
    for (int i = 0; i < items.length; i++) {
      final item = items[i];
      children.add(
        TrendingItem(
          title: item['title'],
          onTap: () {
            final route = item['targetType'] == 'book' ? '/book' : '/hadist';
            context.push(route, extra: {
              'index': item['index'],
              'jsonPath': item['jsonPath'],
            });
          },
        ),
      );
      if (i < items.length - 1) {
        children.add(const DotSeparator());
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Paling Dicari',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 16.h),
        Wrap(
          spacing: 10,
          runSpacing: 14,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: children,
        ),
      ],
    );
  }
}
