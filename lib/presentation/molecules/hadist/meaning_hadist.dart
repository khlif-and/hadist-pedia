import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hadist_pedia/presentation/atom/hadist/section_title.dart';
import 'package:hadist_pedia/presentation/atom/hadist/card_litte_container.dart';

class MeaningHadist extends StatelessWidget {
  final Map<String, dynamic> meaning;

  const MeaningHadist({Key? key, required this.meaning}) : super(key: key);

  Widget build(BuildContext context) {
    return CardLittleContainer(
      margin: EdgeInsets.only(bottom: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: 'Kandungan Hadist'),
          SizedBox(height: 12.h),
          if (meaning['overview'] != null)
            Text(
              meaning['overview'].toString(),
              style: TextStyle(
                color: Colors.white70,
                fontSize: 15.sp,
                height: 1.5,
              ),
            ),
          SizedBox(height: 12.h),
          if (meaning['key_points'] != null)
            ...List<dynamic>.from(meaning['key_points'])
                .map(
                  (point) => Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "• ",
                          style: TextStyle(
                            color: const Color(0xFFD4E99C),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            point.toString(),
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.85),
                              fontSize: 14.sp,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
        ],
      ),
    );
  }
}
