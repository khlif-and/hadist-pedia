import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle headlineLarge = GoogleFonts.plusJakartaSans(
    color: AppColors.white,
    fontSize: 32.sp,
    fontWeight: FontWeight.w800,
  );

  static TextStyle headlineMedium = GoogleFonts.plusJakartaSans(
    color: AppColors.accentLight,
    fontSize: 24.sp,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.5,
  );

  static TextStyle headlineSmall = GoogleFonts.plusJakartaSans(
    color: AppColors.white,
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.3,
  );

  static TextStyle titleLarge = GoogleFonts.plusJakartaSans(
    color: AppColors.white,
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    height: 1.3,
  );

  static TextStyle labelLarge = GoogleFonts.plusJakartaSans(
    letterSpacing: 2.0,
    fontSize: 12.sp,
    fontWeight: FontWeight.w800,
  );

  static TextStyle labelSmall = GoogleFonts.plusJakartaSans(
    fontSize: 10.sp,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.0,
  );

  static TextStyle bodyMedium = GoogleFonts.beVietnamPro(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle bodyMediumBold = GoogleFonts.beVietnamPro(
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle buttonText = GoogleFonts.beVietnamPro(
    fontWeight: FontWeight.w700,
    fontSize: 14.sp,
  );

  static TextStyle linkText = GoogleFonts.beVietnamPro(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle navLabelActive = GoogleFonts.plusJakartaSans(
    color: AppColors.white,
    fontSize: 13.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle navLabelDockedActive = GoogleFonts.plusJakartaSans(
    color: AppColors.white,
    fontSize: 11.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle navLabelDockedInactive = GoogleFonts.plusJakartaSans(
    color: AppColors.white50,
    fontSize: 11.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle hadistTitle = GoogleFonts.beVietnamPro(
    color: AppColors.white,
    fontWeight: FontWeight.w700,
    fontSize: 14.sp,
  );

  static TextStyle hadistDescription = GoogleFonts.beVietnamPro(
    color: AppColors.white60,
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
  );

  static TextStyle trendingTitle = GoogleFonts.plusJakartaSans(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static TextStyle trendingBody = GoogleFonts.beVietnamPro(
    color: AppColors.white80,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    height: 1.5,
  );

  static TextStyle trendingBadge = GoogleFonts.plusJakartaSans(
    color: AppColors.white70,
    letterSpacing: 1.2,
    fontWeight: FontWeight.w600,
    fontSize: 10.sp,
  );
}
