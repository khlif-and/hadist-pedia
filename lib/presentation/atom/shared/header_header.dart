import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderHeader extends StatelessWidget {
  const HeaderHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.15),
            radius: 22.r,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          const Spacer(),
          CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.15),
            radius: 22.r,
            child: IconButton(
              icon: const Icon(Icons.bookmark, color: Colors.white),
              onPressed: () {},
            ),
          ),
          SizedBox(width: 12.w),
          CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.15),
            radius: 22.r,
            child: IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.white),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
