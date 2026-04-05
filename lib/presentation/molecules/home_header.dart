import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_sizes.dart';
import '../../utils/app_text_styles.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSizes.screenPaddingTop,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(AppSizes.paddingSm),
            decoration: const BoxDecoration(
              color: AppColors.accent,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.auto_awesome,
              color: AppColors.white,
              size: AppSizes.iconSm,
            ),
          ),
          SizedBox(width: AppSizes.spacingSm),
          Text('Assalamualaikum', style: AppTextStyles.headlineSmall),
          const Spacer(),
          Image.asset(
            'assets/icons/ic_profile_account.webp',
            width: AppSizes.iconMd,
            height: AppSizes.iconMd,
            color: AppColors.white,
          ),
        ],
      ),
    );
  }
}
