import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hadist_pedia/presentation/atom/home/dot_card.dart';
import 'package:hadist_pedia/presentation/atom/home/card_grid_medium_width.dart';
import 'package:hadist_pedia/presentation/atom/home/headline_card_without_card.dart';

class CardGridContentWithoutCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<dynamic> items;

  const CardGridContentWithoutCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadlineCardWithoutCard(
          title: title,
          subtitle: subtitle,
        ),
        SizedBox(height: 20.h),
        CardGridMediumWidth(items: items),
        SizedBox(height: 16.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: const DotCard(alignment: MainAxisAlignment.start),
        ),
      ],
    );
  }
}
