import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hadist_pedia/presentation/atom/hadist/section_title.dart';
import 'package:hadist_pedia/presentation/atom/hadist/card_litte_container.dart';

class RelevantAyah extends StatelessWidget {
  final List<dynamic> ayats;

  const RelevantAyah({Key? key, required this.ayats}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Ayat Relevan'),
        SizedBox(height: 12.h),
        ...ayats
            .map(
              (a) => CardLittleContainer(
                margin: EdgeInsets.only(bottom: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${a['surah']} (${a['surah_number']}:${a['ayah_number']})",
                          style: TextStyle(
                            color: const Color(0xFFD4E99C),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.bookmark,
                          color: const Color(0xFFD4E99C).withOpacity(0.5),
                          size: 16.sp,
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    if (a['arabic'] != null)
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          a['arabic'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontFamily: 'Amiri',
                            height: 1.8,
                          ),
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    SizedBox(height: 8.h),
                    if (a['translation'] != null)
                      Text(
                        a['translation'],
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.85),
                          fontSize: 14.sp,
                          height: 1.5,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    if (a['relevance'] != null)
                      Padding(
                        padding: EdgeInsets.only(top: 12.h),
                        child: Text(
                          "Relevansi: ${a['relevance']}",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 13.sp,
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
