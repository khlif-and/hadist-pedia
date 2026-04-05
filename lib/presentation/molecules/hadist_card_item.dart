import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_sizes.dart';
import '../../utils/app_text_styles.dart';

class HadistCardItem extends StatelessWidget {
  final String title;
  final String description;

  const HadistCardItem({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes.hadistCardWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: AppSizes.hadistCardImageHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizes.radiusSm),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.hadistCardTop,
                  AppColors.hadistCardBottom,
                ],
              ),
            ),
          ),
          SizedBox(height: AppSizes.spacingSm),
          Text(title, style: AppTextStyles.hadistTitle),
          SizedBox(height: AppSizes.spacingXs),
          Text(description, style: AppTextStyles.hadistDescription),
        ],
      ),
    );
  }
}
