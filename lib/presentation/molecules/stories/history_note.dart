import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryNote extends StatelessWidget {
  final String pageNote;

  const HistoryNote({Key? key, required this.pageNote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            'Catatan Sejarah',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 12.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            pageNote,
            style: TextStyle(
              color: Colors.white.withOpacity(0.85),
              fontSize: 15.sp,
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }
}
