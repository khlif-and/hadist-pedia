import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardOnTheBackground extends StatelessWidget {
  final String imageUrl;

  const CardOnTheBackground({Key? key, required this.imageUrl})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 280.w,
        height: 280.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 30,
              offset: const Offset(0, 15),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32.r),
          child: Image.network(imageUrl, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
