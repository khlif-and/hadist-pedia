import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChipsAndButton extends StatelessWidget {
  const ChipsAndButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      'All',
      'Africa',
      'Europe',
      'Australia',
      'Asia',
    ];

    return ClipRRect(
      // Memberikan efek blur pada area bar kategori
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: double.infinity,
          height: 56.h, // Menyesuaikan dengan tinggi yang dipesan oleh template
          decoration: BoxDecoration(
            // Warna latar belakang bar (Putih kristal transparan)
            color: Colors.white.withOpacity(0.1), 
            border: Border(
              bottom: BorderSide(
                color: Colors.white.withOpacity(0.1),
                width: 1,
              ),
            ),
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            itemBuilder: (context, index) {
              final bool isSelected = index == 0;
              return Center(
                child: Container(
                  margin: EdgeInsets.only(right: 8.w),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: BackdropFilter(
                      filter: isSelected
                          ? ImageFilter.blur(sigmaX: 0, sigmaY: 0)
                          : ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 6.h),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFFD4E99C)
                              : Colors.white.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: isSelected
                                ? Colors.transparent
                                : Colors.white.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          categories[index],
                          style: TextStyle(
                            color: isSelected ? Colors.black : Colors.white,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}