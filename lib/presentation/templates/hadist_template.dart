import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HadistTemplate extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onBackPressed;
  final Widget bottomSheet;

  const HadistTemplate({
    Key? key,
    required this.imageUrl,
    required this.onBackPressed,
    required this.bottomSheet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF151515),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 450.h,
            child: Image.network(imageUrl, fit: BoxFit.cover),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.9),
                      radius: 24.r,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: onBackPressed,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomSheet,
        ],
      ),
    );
  }
}
