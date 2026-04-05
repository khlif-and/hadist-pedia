import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_sizes.dart';

class GlassCapsule extends StatelessWidget {
  final double width;
  final double height;

  const GlassCapsule({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.capsuleRadius),
        border: Border.all(
          color: AppColors.white40,
          width: 1,
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.white25,
            AppColors.white05,
          ],
        ),
      ),
    );
  }
}
