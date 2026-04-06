import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeadlineCard extends StatelessWidget {
  const HeadlineCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Sleep\nSoundscapes',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 26.sp,
            color: Colors.white,
            fontWeight: FontWeight.w700,
            height: 1.2,
          ),
        ),
        SizedBox(height: 12.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Text(
            'Explore our cozy melodies that gently\nguide you into restful sleep.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.white.withOpacity(0.8),
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}