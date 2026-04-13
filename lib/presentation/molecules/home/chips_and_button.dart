import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hadist_pedia/presentation/atom/shared/chip.dart';

class ChipsAndButton extends StatelessWidget {
  const ChipsAndButton({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categories = ['All', 'Hadist', 'Story', 'Dzikr LoFi'];

    return Container(
      width: double.infinity,
      height: 56.h,
      decoration: BoxDecoration(
        color: const Color(0xFF121212),
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withValues(alpha: 0.1),
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
          // Bungkus CategoryChip dengan Center di sini
          return Center(
            child: CategoryChip(
              label: categories[index],
              isSelected: isSelected,
            ),
          );
        },
      ),
    );
  }
}
