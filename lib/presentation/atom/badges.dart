import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Badges extends StatelessWidget {
  final String text;
  const Badges({Key? key, this.text = 'NEW'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: const Color(0xFFD4E99C),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10.sp,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}