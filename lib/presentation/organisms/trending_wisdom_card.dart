import 'package:flutter/material.dart';
import 'dart:ui';
import '../../helpers/time_helper.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_sizes.dart';
import '../../utils/app_text_styles.dart';

class TrendingWisdomCard extends StatelessWidget {
  const TrendingWisdomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSizes.screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Trending Wisdom',
            style: AppTextStyles.headlineSmall.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: AppSizes.spacingMd),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizes.radiusMd),
              image: DecorationImage(
                image: AssetImage(TimeOfDayHelper.backgroundAsset),
                fit: BoxFit.cover,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppSizes.radiusMd),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: AppSizes.trendingBlurSigma,
                  sigmaY: AppSizes.trendingBlurSigma,
                ),
                child: Container(
                  padding: EdgeInsets.all(AppSizes.paddingLg),
                  decoration: BoxDecoration(
                    color: AppColors.white05,
                    borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                    border: Border.all(
                      color: AppColors.white10,
                      width: AppSizes.borderWidth,
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [AppColors.white15, AppColors.white02],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: AppSizes.trendingIconSize,
                        height: AppSizes.trendingIconSize,
                        decoration: const BoxDecoration(
                          color: AppColors.trendingIconBg,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.star,
                            color: AppColors.trendingIconColor,
                            size: AppSizes.trendingStarSize,
                          ),
                        ),
                      ),
                      SizedBox(height: AppSizes.spacingXl),
                      Text(
                        TimeOfDayHelper.greeting,
                        style: AppTextStyles.trendingTitle,
                      ),
                      SizedBox(height: AppSizes.spacingSm),
                      Text(
                        'Explore the prophet\'s teachings on mindfulness and devotion in an age of constant distraction.',
                        style: AppTextStyles.trendingBody,
                      ),
                      SizedBox(height: AppSizes.spacingXl),
                      Divider(
                        color: AppColors.white10,
                        thickness: 1,
                        height: 1,
                      ),
                      SizedBox(height: AppSizes.spacingLg),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('12 HADIST', style: AppTextStyles.trendingBadge),
                          Icon(
                            Icons.arrow_forward,
                            color: AppColors.white,
                            size: AppSizes.iconXs,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
