import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hadist_pedia/presentation/common/utils/constant/style.dart';

class ContainerBigCard extends StatelessWidget {
  final Widget child;
  
  const ContainerBigCard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(32.r),
      child: BackdropFilter(
        filter: AppStyle.blurBackground,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 32.h),
          decoration: BoxDecoration(
            color: AppStyle.overlayDarkBackground,
            borderRadius: BorderRadius.circular(32.r),
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
              width: 1.2,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}