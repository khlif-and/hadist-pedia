import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hadist_pedia/presentation/atom/hadist/section_title.dart';
import 'package:hadist_pedia/presentation/atom/hadist/card_litte_container.dart';

class TafsirHadist extends StatelessWidget {
  final List<dynamic> scholars;

  const TafsirHadist({Key? key, required this.scholars}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Tafsir Ulama'),
        SizedBox(height: 12.h),
        ...scholars
            .map(
              (s) => CardLittleContainer(
                margin: EdgeInsets.only(bottom: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      s['scholar'] ?? '',
                      style: TextStyle(
                        color: const Color(0xFFD4E99C),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (s['work'] != null)
                      Text(
                        "Kitab: ${s['work']}",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 13.sp,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    SizedBox(height: 8.h),
                    if (s['explanation'] != null)
                      Text(
                        s['explanation'],
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.85),
                          fontSize: 14.sp,
                          height: 1.5,
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
