import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_sizes.dart';
import '../../utils/app_text_styles.dart';
import '../atoms/status_badge.dart';
import '../atoms/action_button.dart';

class QuoteCard extends StatelessWidget {
  final String badge;
  final String quote;
  final String source;
  final VoidCallback? onReadMore;

  const QuoteCard({
    super.key,
    this.badge = 'AUTHENTIC',
    this.quote = '"The best of you are those who have the best manners and character."',
    this.source = 'Sahih Bukhari',
    this.onReadMore,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSizes.screenPadding,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            border: Border.all(
              color: AppColors.white08,
              width: AppSizes.borderWidth,
            ),
            borderRadius: BorderRadius.circular(AppSizes.radiusLg),
          ),
          child: Stack(
            children: [
              Positioned(
                top: -AppSizes.glowOffsetXl,
                right: -AppSizes.glowOffsetSm,
                child: Container(
                  width: AppSizes.glowSize,
                  height: AppSizes.glowSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        AppColors.accentLight.withOpacity(0.5),
                        AppColors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -AppSizes.glowOffsetLg,
                left: -AppSizes.glowOffsetMd,
                child: Container(
                  width: AppSizes.glowSize,
                  height: AppSizes.glowSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        AppColors.info.withOpacity(0.4),
                        AppColors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: AppSizes.cardPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StatusBadge(label: badge),
                    SizedBox(height: AppSizes.spacingLg),
                    Text(quote, style: AppTextStyles.titleLarge),
                    SizedBox(height: AppSizes.spacingXxl),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          source,
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.white60,
                          ),
                        ),
                        ActionButton(
                          label: 'Read More',
                          onTap: onReadMore,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
