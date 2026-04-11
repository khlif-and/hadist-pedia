import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hadist_pedia/presentation/atom/hadist/author_hadist.dart';

class AuthorSection extends StatelessWidget {
  final int index;
  final String jsonPath;
  const AuthorSection({
    Key? key,
    this.index = 0,
    this.jsonPath = 'lib/json/hadist_bukhari.json',
  }) : super(key: key);

  Future<Map<String, dynamic>> _loadAuthor() async {
    try {
      final String response = await rootBundle.loadString(jsonPath);
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
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData &&
            snapshot.data!.isNotEmpty) {
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
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 6.h,
                    ),
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
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              if (author['full_name_arabic'] != null)
                Text(
                  author['full_name_arabic'].toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
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
