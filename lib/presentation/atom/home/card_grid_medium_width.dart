import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hadist_pedia/presentation/common/utils/database/app_database.dart';
import '../shared/badges.dart';
import 'headline_content.dart';

class CardGridMediumWidth extends StatelessWidget {
  final List<dynamic> items;

  const CardGridMediumWidth({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        itemCount: items.length,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        addRepaintBoundaries: true,
        addAutomaticKeepAlives: false,
        itemBuilder: (context, index) {
          final item = items[index];
          final cardTitle = item['card_title']?.toString() ?? '';
          final badgeText = item['badge_text']?.toString() ?? '';
          final targetType = item['target_type']?.toString() ?? 'book';
          final targetFile =
              item['target_file']?.toString() ?? 'lib/json/story_tabiin.json';
          final targetIndex = item['target_index'] as int? ?? 0;

          return RepaintBoundary(
            child: GestureDetector(
              onTap: () {
                AppDatabase.instance.addLike(
                  targetType,
                  targetFile,
                  targetIndex,
                );
                if (targetType == 'book') {
                  context.push(
                    '/book',
                    extra: {'index': targetIndex, 'jsonPath': targetFile},
                  );
                } else {
                  context.push(
                    '/hadist',
                    extra: {'index': targetIndex, 'jsonPath': targetFile},
                  );
                }
              },
              child: Container(
                width: 280.w,
                margin: EdgeInsets.only(right: 16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.r),
                  color: Colors.white.withValues(alpha: 0.1),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.15),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 16.h,
                      left: 16.w,
                      right: 16.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Badges(text: badgeText),
                          SizedBox(height: 8.h),
                          HeadlineContent(title: cardTitle),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
