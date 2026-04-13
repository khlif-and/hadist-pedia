import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hadist_pedia/presentation/common/utils/engine/feed_engine.dart';
import 'package:hadist_pedia/presentation/molecules/home/card_grid_content_without_card.dart';

class FeedSectionRow extends StatelessWidget {
  final Future<FeedSection> Function() sectionLoader;

  const FeedSectionRow({super.key, required this.sectionLoader});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FeedSection>(
      future: sectionLoader(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            height: 200.h,
            child: const Center(
              child: CircularProgressIndicator(color: Color(0xFFD4E99C)),
            ),
          );
        }

        final section = snapshot.data;
        if (section == null || section.items.isEmpty) {
          return const SizedBox.shrink();
        }

        return RepaintBoundary(
          child: Column(
            children: [
              CardGridContentWithoutCard(
                title: section.title,
                subtitle: '',
                items: section.items,
              ),
              SizedBox(height: 24.h),
            ],
          ),
        );
      },
    );
  }
}
