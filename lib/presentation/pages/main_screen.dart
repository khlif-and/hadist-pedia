import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_sizes.dart';
import '../../utils/app_text_styles.dart';
import '../templates/glow_background.dart';
import '../molecules/home_header.dart';
import '../molecules/section_title.dart';
import '../organisms/category_chip_bar.dart';
import '../organisms/quote_card.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: GlowBackground(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHeader(),
              SizedBox(height: AppSizes.spacingXl),
              const CategoryChipBar(
                categories: ['All', 'Hadith', 'Daily Vibe', 'Reflections', 'Audio'],
                selectedIndex: 0,
              ),
              SizedBox(height: AppSizes.spacingSection),
              const SectionTitle(
                label: 'FOR YOU',
                title: 'Daily Vibe',
                actionText: 'View History',
              ),
              SizedBox(height: AppSizes.spacingMd),
              const QuoteCard(),
              SizedBox(height: AppSizes.spacingSection),
              Padding(
                padding: AppSizes.screenPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hadist Imam Bukhari',
                      style: AppTextStyles.headlineSmall,
                    ),
                    Text(
                      'See All',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.white60,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSizes.spacingMd),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  children: List.generate(4, (index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 16.w),
                      child: SizedBox(
                        width: 140.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 140.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFF001D4A),
                                    Color(0xFF86B9D8),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              'Al-Jami\' al-Shahih',
                              style: AppTextStyles.buttonText.copyWith(
                                color: AppColors.white,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              'Hadist populer karya imam bukhari yang...',
                              style: AppTextStyles.labelSmall.copyWith(
                                color: AppColors.white60,
                                fontWeight: FontWeight.normal,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
