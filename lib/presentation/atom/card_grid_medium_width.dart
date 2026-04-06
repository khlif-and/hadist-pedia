import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'badges.dart';
import 'headline_content.dart';

class CardGridMediumWidth extends StatelessWidget {
  const CardGridMediumWidth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none, // Agar shadow/border tidak terpotong saat scroll
        itemCount: 3,
        // Gunakan padding 24.w di sini agar kartu pertama sejajar dengan judul,
        // tapi saat di-scroll kartu bisa lewat sampai ke ujung layar.
        padding: EdgeInsets.symmetric(horizontal: 24.w), 
        itemBuilder: (context, index) {
          return Container(
            width: 280.w, // Diperlebar sedikit agar lebih terasa edge-to-edge
            margin: EdgeInsets.only(right: 16.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              color: Colors.white.withOpacity(0.1),
              border: Border.all(
                color: Colors.white.withOpacity(0.15),
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
                      const Badges(),
                      SizedBox(height: 8.h),
                      const HeadlineContent(title: 'Hadist Morning Routine'),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}