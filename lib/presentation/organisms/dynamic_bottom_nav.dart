import 'package:flutter/material.dart';
import 'dart:ui';
import '../../utils/app_colors.dart';
import '../../utils/app_sizes.dart';
import '../atoms/glass_capsule.dart';
import '../molecules/nav_item.dart';

class DynamicBottomNav extends StatelessWidget {
  final bool isDocked;
  final int selectedIndex;
  final ValueChanged<int> onTap;
  final List<Map<String, dynamic>> items;

  const DynamicBottomNav({
    super.key,
    required this.isDocked,
    required this.selectedIndex,
    required this.onTap,
    required this.items,
  });

  BorderRadius _buildRadius() {
    return BorderRadius.only(
      topLeft: Radius.circular(isDocked ? AppSizes.navBarRadiusDocked : AppSizes.navBarRadiusFloating),
      topRight: Radius.circular(isDocked ? AppSizes.navBarRadiusDocked : AppSizes.navBarRadiusFloating),
      bottomLeft: Radius.circular(isDocked ? 0 : AppSizes.navBarRadiusFloating),
      bottomRight: Radius.circular(isDocked ? 0 : AppSizes.navBarRadiusFloating),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOutCubic,
      padding: isDocked
          ? EdgeInsets.zero
          : EdgeInsets.fromLTRB(AppSizes.navBarPaddingFloatingH, 0, AppSizes.navBarPaddingFloatingH, AppSizes.navBarPaddingFloatingB),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutCubic,
        height: isDocked ? AppSizes.navBarHeightDocked : AppSizes.navBarHeightFloating,
        decoration: BoxDecoration(
          borderRadius: _buildRadius(),
          boxShadow: [
            BoxShadow(
              color: isDocked ? AppColors.white05 : AppColors.white10,
              blurRadius: AppSizes.navBarShadowBlur,
              offset: Offset(0, isDocked ? -2 : 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: _buildRadius(),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: AppSizes.navBarBlurSigma,
              sigmaY: AppSizes.navBarBlurSigma,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.navBarPaddingH),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.white20,
                  width: AppSizes.borderWidthThin,
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.white18, AppColors.white04],
                ),
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final double w = constraints.maxWidth;
                  final double dockedItemW = w / items.length;
                  final double floatingActiveW = w * AppSizes.capsuleFloatingFactor;
                  final double floatingInactiveW = (w - floatingActiveW) / (items.length - 1);

                  final double activeItemW = isDocked ? dockedItemW : floatingActiveW;
                  final double inactiveItemW = isDocked ? dockedItemW : floatingInactiveW;

                  final double capsuleW = isDocked ? w / AppSizes.capsuleDockedDivisor : floatingActiveW;
                  final double capsuleH = isDocked ? AppSizes.capsuleHeightDocked : AppSizes.capsuleHeightFloating;

                  final double capsuleLeft = isDocked
                      ? selectedIndex * dockedItemW + (dockedItemW - capsuleW) / 2
                      : selectedIndex * floatingInactiveW;

                  return Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeOutBack,
                        left: capsuleLeft,
                        top: isDocked ? AppSizes.capsuleTopDocked : AppSizes.capsuleTopFloating,
                        width: capsuleW,
                        height: capsuleH,
                        child: GlassCapsule(width: capsuleW, height: capsuleH),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        child: Row(
                          children: List.generate(items.length, (index) {
                            bool isActive = selectedIndex == index;
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 350),
                              curve: Curves.easeOutBack,
                              width: isActive ? activeItemW : inactiveItemW,
                              child: GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () => onTap(index),
                                child: NavItem(
                                  icon: items[index]['icon'],
                                  label: items[index]['label'],
                                  isActive: isActive,
                                  isDocked: isDocked,
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
