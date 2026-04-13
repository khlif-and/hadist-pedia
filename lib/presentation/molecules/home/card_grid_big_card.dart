import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hadist_pedia/presentation/common/utils/database/app_database.dart';
import 'package:hadist_pedia/presentation/atom/shared/dot_card.dart';

class CardGridBigCard extends StatelessWidget {
  final String title;
  final List<dynamic> items;

  const CardGridBigCard({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  'See all',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          SizedBox(
            height: 260.h,
            child: items.isEmpty
                ? Center(
                    child: Text(
                      'Belum ada data',
                      style: TextStyle(color: Colors.white54, fontSize: 14.sp),
                    ),
                  )
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    itemCount: items.length,
                    addRepaintBoundaries: true,
                    addAutomaticKeepAlives: false,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      final badgeText = item['badge_text'] ?? 'Hadist';
                      final cardTitle = item['card_title'] ?? '';
                      final cardSubtitle = item['card_subtitle'] ?? '';
                      final targetFile =
                          item['target_file'] ?? 'lib/json/hadist_bukhari.json';
                      final targetIndex = item['target_index'] ?? 0;
                      final targetType =
                          item['target_type']?.toString() ?? 'hadist';

                      return RepaintBoundary(
                        child: GestureDetector(
                          onTap: () {
                            AppDatabase.instance.addLike(
                              targetType,
                              targetFile.toString(),
                              targetIndex as int,
                            );
                            if (targetType == 'book') {
                              context.push(
                                '/book',
                                extra: {
                                  'index': targetIndex,
                                  'jsonPath': targetFile,
                                },
                              );
                            } else {
                              context.push(
                                '/hadist',
                                extra: {
                                  'index': targetIndex,
                                  'jsonPath': targetFile,
                                },
                              );
                            }
                          },
                          child: Container(
                            width: 200.w,
                            margin: EdgeInsets.only(right: 16.w),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24.r),
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: Image.network(
                                      'https://picsum.photos/400/600?random=${cardTitle.hashCode}',
                                      fit: BoxFit.cover,
                                      cacheWidth: 400,
                                      cacheHeight: 600,
                                      gaplessPlayback: true,
                                      frameBuilder:
                                          (
                                            context,
                                            child,
                                            frame,
                                            wasSynchronouslyLoaded,
                                          ) {
                                            if (wasSynchronouslyLoaded)
                                              return child;
                                            return AnimatedOpacity(
                                              opacity: frame == null ? 0 : 1,
                                              duration: const Duration(
                                                milliseconds: 300,
                                              ),
                                              curve: Curves.easeOut,
                                              child: child,
                                            );
                                          },
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                            return Container(
                                              color: Colors.white.withValues(
                                                alpha: 0.05,
                                              ),
                                              child: Icon(
                                                Icons.image_outlined,
                                                color: Colors.white24,
                                                size: 48.sp,
                                              ),
                                            );
                                          },
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.transparent,
                                            Colors.black.withValues(alpha: 0.2),
                                            Colors.black.withValues(
                                              alpha: 0.85,
                                            ),
                                          ],
                                          stops: const [0.4, 0.7, 1.0],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 16.h,
                                    right: 16.w,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10.w,
                                        vertical: 6.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                          12.r,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.verified_outlined,
                                            size: 16.sp,
                                            color: Colors.black,
                                          ),
                                          SizedBox(width: 4.w),
                                          Text(
                                            badgeText.toString(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 16.w,
                                    right: 16.w,
                                    bottom: 16.h,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          targetType == 'book'
                                              ? 'KISAH PILIHAN'
                                              : 'HIGHLIGHT HARI INI',
                                          style: TextStyle(
                                            color: const Color(0xFFD4E99C),
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: 4.h),
                                        Text(
                                          cardTitle.toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: 8.h),
                                        Text(
                                          cardSubtitle.toString(),
                                          style: TextStyle(
                                            color: Colors.white.withValues(
                                              alpha: 0.9,
                                            ),
                                            fontSize: 13.sp,
                                            height: 1.4,
                                          ),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: const DotCard(alignment: MainAxisAlignment.start),
          ),
        ],
      ),
    );
  }
}
