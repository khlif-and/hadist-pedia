import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../atom/author_hadist.dart';
import '../atom/categories_hadist.dart';
import '../atom/hadist_content.dart';
import '../atom/headline_hadist.dart';
import '../atom/related_hadist_card.dart';

class HadistBottomSheet extends StatelessWidget {
  final int index;
  const HadistBottomSheet({Key? key, this.index = 0}) : super(key: key);

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
                HeadlineHadist(title: 'Keutamaan Menuntut Ilmu', index: index),
                SizedBox(height: 16.h),
                _AuthorSection(index: index),
                SizedBox(height: 24.h),
                CategoriesHadist(index: index),
                SizedBox(height: 32.h),
                HadistContent(index: index),
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

class _AuthorSection extends StatelessWidget {
  final int index;
  const _AuthorSection({Key? key, this.index = 0}) : super(key: key);

  Future<Map<String, dynamic>> _loadAuthor() async {
    try {
      final String response = await rootBundle.loadString('lib/json/hadist_bukhari.json');
      final List<dynamic> data = json.decode(response);
      if (data.length > index) return data[index] as Map<String, dynamic>;
      return data[0] as Map<String, dynamic>;
    } catch (e) {
      return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: _loadAuthor(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData && snapshot.data!.isNotEmpty) {
          final data = snapshot.data!;
          final type = data['type'] ?? 'Shahih';
          final author = data['author'] ?? {};
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD4E99C),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      type.toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Text(
                      author['known_as']?.toString() ?? '',
                      style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              if (author['full_name_arabic'] != null)
                Text(
                  author['full_name_arabic'].toString(),
                  style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
              SizedBox(height: 4.h),
              if (author['full_name'] != null)
                Text(
                  author['full_name'].toString(),
                  style: TextStyle(color: Colors.white70, fontSize: 14.sp),
                ),
              SizedBox(height: 4.h),
              if (author['born'] != null)
                Text(
                  "Lahir: ${author['born']}",
                  style: TextStyle(color: Colors.white54, fontSize: 12.sp),
                ),
              if (author['died'] != null)
                Text(
                  "Wafat: ${author['died']}",
                  style: TextStyle(color: Colors.white54, fontSize: 12.sp),
                ),
            ],
          );
        }
        return const AuthorHadist(status: 'Memuat...', author: '...');
      },
    );
  }
}
