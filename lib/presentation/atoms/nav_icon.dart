import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_sizes.dart';

class NavIcon extends StatelessWidget {
  final IconData icon;
  final bool isActive;

  const NavIcon({
    super.key,
    required this.icon,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: isActive ? AppColors.white : AppColors.white40,
      size: AppSizes.navIconSize,
    );
  }
}
