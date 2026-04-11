import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InformationWv extends StatelessWidget {
  final String chapterNum;
  final String categoryFirst;

  const InformationWv({
    Key? key,
    required this.chapterNum,
    required this.categoryFirst,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        children: [
          _buildStatItem(
            Icons.menu_book,
            'Bab $chapterNum',
            iconColor: const Color(0xFFD4E99C),
          ),
          SizedBox(width: 24.w),
          _buildStatItem(Icons.label_outline, categoryFirst),
          SizedBox(width: 24.w),
          _buildStatItem(Icons.library_books, 'Riwayat Classic'),
        ],
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String value, {Color? iconColor}) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor ?? Colors.white.withOpacity(0.5),
          size: 18.sp,
        ),
        SizedBox(width: 6.w),
        Text(
          value,
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
