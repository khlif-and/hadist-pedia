import 'package:flutter/material.dart';
import '../../utils/app_sizes.dart';
import '../../utils/app_text_styles.dart';
import '../atoms/nav_icon.dart';

class NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final bool isDocked;

  const NavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isActive,
    required this.isDocked,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isDocked ? AppSizes.navItemHeightDocked : AppSizes.navItemHeightFloating,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NavIcon(icon: icon, isActive: isActive),
              if (isActive && !isDocked)
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(left: AppSizes.navLabelSpacing),
                    child: Text(
                      label,
                      style: AppTextStyles.navLabelActive,
                      maxLines: 1,
                      softWrap: false,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
            ],
          ),
          if (isDocked) ...[
            SizedBox(height: AppSizes.navLabelDockedSpacing),
            Text(
              label,
              style: isActive
                  ? AppTextStyles.navLabelDockedActive
                  : AppTextStyles.navLabelDockedInactive,
            ),
          ],
        ],
      ),
    );
  }
}
