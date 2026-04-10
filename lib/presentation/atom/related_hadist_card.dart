import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RelatedHadistCard extends StatelessWidget {
  final int index;
  final String title;
  final String source;

  const RelatedHadistCard({
    Key? key,
    required this.index,
    this.title = 'Jalan Menuju Surga',
    this.source = 'HR. Muslim',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240.w,
      margin: EdgeInsets.only(right: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.network(
                  'https://picsum.photos/400/300?random=$index',
                  height: 150.h,
                  width: 240.w,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 12.h,
                right: 12.w,
                child: CircleAvatar(
                  radius: 16.r,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.arrow_outward,
                    color: Colors.black,
                    size: 18.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4.h),
          Text(
            source,
            style: TextStyle(color: Colors.white70, fontSize: 13.sp),
          ),
        ],
      ),
    );
  }
}
