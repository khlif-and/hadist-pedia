import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SideBorderCard extends StatelessWidget {
  final Widget child;
  final Color borderColor;
  final Color backgroundColor;
  final double borderWidth;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;

  const SideBorderCard({
    Key? key,
    required this.child,
    required this.borderColor,
    required this.backgroundColor,
    this.borderWidth = 3.0,
    this.borderRadius = 8.0,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius.r),
        border: Border(
          left: BorderSide(color: borderColor, width: borderWidth.w),
        ),
      ),
      child: child,
    );
  }
}
