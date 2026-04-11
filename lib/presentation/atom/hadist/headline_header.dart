import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeadlineHeader extends StatelessWidget {
  const HeadlineHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Text(
        'DISCOVER',
        maxLines: 1,
        style: TextStyle(
          fontSize: 40.sp,
          color: Colors.white,
          fontWeight: FontWeight.w300,
          letterSpacing: -6.w,
          height: 1.0,
          fontFamily: 'serif',
        ),
      ),
    );
  }
}