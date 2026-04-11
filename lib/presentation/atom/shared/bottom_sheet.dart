import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBottomSheet extends StatelessWidget {
  final List<Widget> children;
  final double initialChildSize;
  final double minChildSize;
  final double maxChildSize;
  final EdgeInsetsGeometry? padding;

  const AppBottomSheet({
    Key? key,
    required this.children,
    this.initialChildSize = 0.6,
    this.minChildSize = 0.6,
    this.maxChildSize = 0.95,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: initialChildSize,
      minChildSize: minChildSize,
      maxChildSize: maxChildSize,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1C1C1E),
            borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            physics: const ClampingScrollPhysics(),
            padding: padding ??
                EdgeInsets.only(
                  left: 24.w,
                  right: 24.w,
                  top: 24.h,
                  bottom: MediaQuery.of(context).padding.bottom + 24.h,
                ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40.w,
                    height: 4.h,
                    margin: EdgeInsets.only(bottom: 24.h),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
                ...children,
              ],
            ),
          ),
        );
      },
    );
  }
}
