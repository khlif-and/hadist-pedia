import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeadlineCardWithoutCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const HeadlineCardWithoutCard({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 22.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.white.withOpacity(0.6),
                ),
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.white.withOpacity(0.8),
            size: 18.w,
          ),
        ],
      ),
    );
  }
}