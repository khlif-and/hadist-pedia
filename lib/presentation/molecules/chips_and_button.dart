import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hadist_pedia/presentation/atom/chip.dart';

class ChipsAndButton extends StatelessWidget {
  const ChipsAndButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> categories = ['All', 'Hadist', 'Story', 'Dzikr LoFi'];

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: double.infinity,
          height: 56.h,
          decoration: BoxDecoration(
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
              return CategoryChip(
                label: categories[index],
                isSelected: isSelected,
              );
            },
          ),
        ),
      ),
    );
  }
}
