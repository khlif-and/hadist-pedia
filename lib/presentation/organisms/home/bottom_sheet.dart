import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hadist_pedia/presentation/atom/hadist/categories_hadist.dart';
import 'package:hadist_pedia/presentation/atom/hadist/headline_hadist.dart';
import 'package:hadist_pedia/presentation/atom/hadist/related_hadist_card.dart';
import 'package:hadist_pedia/presentation/organisms/hadist/hadist_content.dart';
import '../../molecules/hadist/author_section.dart';

class HadistBottomSheet extends StatelessWidget {
  final int index;
  final String jsonPath;
  const HadistBottomSheet({
    Key? key,
    this.index = 0,
    this.jsonPath = 'lib/json/hadist_bukhari.json',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.6,
      maxChildSize: 0.95,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1C1C1E),
            borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.only(
              left: 24.w,
              right: 24.w,
              top: 24.h,
              bottom: MediaQuery.of(context).padding.bottom + 24.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40.w,
                    height: 4.h,
                    margin: EdgeInsets.only(bottom: 24.h),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
                HeadlineHadist(
                  title: 'Keutamaan Menuntut Ilmu',
                  index: index,
                  jsonPath: jsonPath,
                ),
                SizedBox(height: 16.h),
                AuthorSection(index: index, jsonPath: jsonPath),
                SizedBox(height: 24.h),
                CategoriesHadist(index: index, jsonPath: jsonPath),
                SizedBox(height: 32.h),
                HadistContent(index: index, jsonPath: jsonPath),
                SizedBox(height: 40.h),
                Text(
                  'Related Hadist',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  height: 230.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.none,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return RelatedHadistCard(index: index);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
