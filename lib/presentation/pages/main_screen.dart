import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hadist_pedia/helpers/time_helper.dart';
import 'dart:ui';
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
                categories: [
                  'All',
                  'Hadith',
                  'Daily Vibe',
                  'Reflections',
                  'Audio',
                ],
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
              SizedBox(height: AppSizes.spacingSection),
              Padding(
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
                    SizedBox(height: 16.h),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        image: DecorationImage(
                          image: AssetImage(TimeOfDayHelper.backgroundAsset),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.r),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: Container(
                            padding: EdgeInsets.all(20.w),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(20.r),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.1),
                                width: 1.5,
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.white.withOpacity(0.15),
                                  Colors.white.withOpacity(0.02),
                                ],
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 40.w,
                                  height: 40.w,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF352F52),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.star,
                                      color: const Color(0xFF9E7CFF),
                                      size: 20.w,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 24.h),
                                Text(
                                  TimeOfDayHelper.greeting,
                                  style: AppTextStyles.headlineSmall.copyWith(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 12.h),
                                Text(
                                  'Explore the prophet\'s teachings on mindfulness and devotion in an age of constant distraction.',
                                  style: AppTextStyles.bodyMedium.copyWith(
                                    color: AppColors.white.withOpacity(0.8),
                                    height: 1.5,
                                  ),
                                ),
                                SizedBox(height: 24.h),
                                Divider(
                                  color: Colors.white.withOpacity(0.1),
                                  thickness: 1,
                                  height: 1,
                                ),
                                SizedBox(height: 20.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '12 HADIST',
                                      style: AppTextStyles.labelSmall.copyWith(
                                        color: AppColors.white.withOpacity(0.7),
                                        letterSpacing: 1.2,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                      size: 20.w,
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
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
