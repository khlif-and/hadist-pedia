import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DotCard extends StatelessWidget {
  final MainAxisAlignment alignment; // Tambahkan parameter ini

  const DotCard({
    Key? key,
    this.alignment = MainAxisAlignment.center, // Default tetap di tengah
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment, // Gunakan variabel di sini
      children: [
        Container(
          width: 28.w,
          height: 6.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
        SizedBox(width: 8.w),
        _buildDot(),
        SizedBox(width: 8.w),
        _buildDot(),
      ],
    );
  }

  Widget _buildDot() {
    return Container(
      width: 8.w,
      height: 8.h,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        shape: BoxShape.circle,
      ),
    );
  }
}