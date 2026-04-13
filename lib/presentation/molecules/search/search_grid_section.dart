import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hadist_pedia/presentation/atom/shared/card_grid.dart';

class SearchGridSection extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  const SearchGridSection({super.key, required this.items});

  static const List<Color> _cardColors = [
    Color(0xFF1E3A5F),
    Color(0xFF3A1E5F),
    Color(0xFF5F1E3A),
    Color(0xFF1E5F3A),
    Color(0xFF5F3A1E),
    Color(0xFF2D4A6B),
  ];

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 2.0,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return RepaintBoundary(
          child: CategoryCard(
            title: item['title'],
            backgroundColor: _cardColors[index % _cardColors.length],
            onTap: () {
              final route = item['targetType'] == 'book' ? '/book' : '/hadist';
              context.push(route, extra: {
                'index': item['index'],
                'jsonPath': item['jsonPath'],
              });
            },
          ),
        );
      },
    );
  }
}
