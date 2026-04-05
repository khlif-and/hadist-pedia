import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSizes {
  AppSizes._();

  static double paddingXs = 4.w;
  static double paddingSm = 8.w;
  static double paddingMd = 12.w;
  static double paddingLg = 20.w;
  static double paddingXl = 24.w;

  static double spacingXs = 4.h;
  static double spacingSm = 12.h;
  static double spacingMd = 16.h;
  static double spacingLg = 20.h;
  static double spacingXl = 24.h;
  static double spacingXxl = 32.h;
  static double spacingSection = 36.h;

  static double radiusSm = 12.r;
  static double radiusMd = 20.r;
  static double radiusLg = 28.r;
  static double radiusXl = 30.r;
  static double radiusXxl = 40.r;

  static double iconSm = 24.w;
  static double iconMd = 32.w;
  static double iconXs = 20.w;

  static double avatarRadius = 18.r;
  static double borderWidth = 1.5.w;
  static double borderWidthThin = 1.2;

  static double glowSize = 250.w;
  static double glowOffsetSm = 20.w;
  static double glowOffsetMd = 40.w;
  static double glowOffsetLg = 50.h;
  static double glowOffsetXl = 60.h;

  static double navBarHeightDocked = 100.h;
  static double navBarHeightFloating = 72.h;
  static double navBarRadiusDocked = 30.r;
  static double navBarRadiusFloating = 40.r;
  static double navBarBlurSigma = 25.0;
  static double navBarPaddingH = 8.w;
  static double navBarPaddingFloatingH = 16.w;
  static double navBarPaddingFloatingB = 32.h;
  static double navBarShadowBlur = 30.0;

  static double capsuleRadius = 30.r;
  static double capsuleHeightDocked = 60.h;
  static double capsuleHeightFloating = 48.h;
  static double capsuleTopDocked = 20.h;
  static double capsuleTopFloating = 12.h;
  static double capsuleDockedDivisor = 4.2;
  static double capsuleFloatingFactor = 0.38;

  static double navIconSize = 22.w;
  static double navItemHeightDocked = 70.h;
  static double navItemHeightFloating = 48.h;
  static double navLabelSpacing = 6.w;
  static double navLabelDockedSpacing = 4.h;
  static double navScrollThreshold = 40.0;

  static double hadistCardWidth = 140.w;
  static double hadistCardImageHeight = 140.w;
  static double hadistCardSpacing = 16.w;

  static double trendingIconSize = 40.w;
  static double trendingStarSize = 20.w;
  static double trendingBlurSigma = 10.0;

  static double bottomScrollPadding = 140.h;

  static EdgeInsets screenPadding = EdgeInsets.symmetric(horizontal: paddingXl);
  static EdgeInsets screenPaddingTop = EdgeInsets.only(
    left: paddingXl,
    right: paddingXl,
    top: paddingLg,
  );
  static EdgeInsets chipPadding = EdgeInsets.symmetric(
    horizontal: paddingLg,
    vertical: 10.h,
  );
  static EdgeInsets badgePadding = EdgeInsets.symmetric(
    horizontal: paddingMd,
    vertical: 6.h,
  );
  static EdgeInsets buttonPadding = EdgeInsets.symmetric(
    horizontal: paddingXl,
    vertical: paddingMd,
  );
  static EdgeInsets cardPadding = EdgeInsets.all(paddingXl);
}
