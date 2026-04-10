import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hadist_pedia/presentation/atom/dot_card.dart';

class CardGridBigCard extends StatelessWidget {
  const CardGridBigCard({Key? key}) : super(key: key);

  Future<List<dynamic>> _loadData() async {
    try {
      final String response = await rootBundle.loadString('lib/json/hadist_bukhari.json');
      return json.decode(response) as List<dynamic>;
    } catch (e) {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: _loadData(),
      builder: (context, snapshot) {
        List<dynamic> items = [];
        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          items = snapshot.data!.take(7).toList();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Hadist of the day',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
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
              height: 380.h,
              child: items.isEmpty
                  ? Center(child: CircularProgressIndicator(color: const Color(0xFFD4E99C)))
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        final book = item['book'] ?? {};
                        final type = item['type'] ?? 'Shahih';
                        final meaning = item['meaning'] ?? {};

                        return GestureDetector(
                          onTap: () {
                            // Arahkan ke route halaman HadistPage dengan membawa index
                            context.push('/hadist', extra: index);
                          },
                          child: Container(
                            width: 260.w,
                            margin: EdgeInsets.only(right: 16.w),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24.r),
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: Image.network(
                                      'https://picsum.photos/400/600?random=$index', // random image for variety
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.transparent,
                                            Colors.black.withOpacity(0.2),
                                            Colors.black.withOpacity(0.9),
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
                                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12.r),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(Icons.verified_outlined, size: 16.sp, color: Colors.black),
                                          SizedBox(width: 4.w),
                                          Text(
                                            type.toString(),
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
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          book['chapter_name_translated']?.toString() ?? '',
                                          style: TextStyle(
                                            color: const Color(0xFFD4E99C),
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: 4.h),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                (item['category'] != null && item['category'].isNotEmpty) 
                                                  ? item['category'].first.toString() 
                                                  : 'Hadist ke-${item['number']}',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 22.sp,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            SizedBox(width: 8.w),
                                            Text(
                                              book['name']?.toString() ?? '',
                                              style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 8.h),
                                        Text(
                                          meaning['overview']?.toString() ?? '',
                                          style: TextStyle(
                                            color: Colors.white.withOpacity(0.9),
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
                        );
                      },
                    ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: const DotCard(
                alignment: MainAxisAlignment.start,
              ),
            ),
          ],
        );
      },
    );
  }
}