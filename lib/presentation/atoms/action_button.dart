import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_sizes.dart';
import '../../utils/app_text_styles.dart';

class ActionButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const ActionButton({
    super.key,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: AppSizes.buttonPadding,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        ),
        child: Text(
          label,
          style: AppTextStyles.buttonText.copyWith(
            color: AppColors.surface,
          ),
        ),
      ),
    );
  }
}
