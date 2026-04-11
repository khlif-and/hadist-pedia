import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Author extends StatelessWidget {
  final String status;
  final String author;
  final String? fullNameArabic;
  final String? fullName;
  final String? additionalInfo1;
  final String? additionalInfo2;

  const Author({
    Key? key,
    required this.status,
    required this.author,
    this.fullNameArabic,
    this.fullName,
    this.additionalInfo1,
    this.additionalInfo2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                status,
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
                author,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        if (fullNameArabic != null) ...[
          SizedBox(height: 12.h),
          Text(
            fullNameArabic!,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
        if (fullName != null) ...[
          SizedBox(height: 4.h),
          Text(
            fullName!,
            style: TextStyle(color: Colors.white70, fontSize: 14.sp),
          ),
        ],
        if (additionalInfo1 != null) ...[
          SizedBox(height: 4.h),
          Text(
            additionalInfo1!,
            style: TextStyle(color: Colors.white54, fontSize: 12.sp),
          ),
        ],
        if (additionalInfo2 != null) ...[
          if (additionalInfo1 == null) SizedBox(height: 4.h),
          Text(
            additionalInfo2!,
            style: TextStyle(color: Colors.white54, fontSize: 12.sp),
          ),
        ],
      ],
    );
  }
}
