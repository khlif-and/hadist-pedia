import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hadist_pedia/presentation/atom/dot_card.dart';
import 'package:hadist_pedia/presentation/atom/card_grid_medium_width.dart';
import 'package:hadist_pedia/presentation/atom/headline_card_without_card.dart';

class CardGridContentWithoutCard extends StatelessWidget {
  const CardGridContentWithoutCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Atom Headline
        const HeadlineCardWithoutCard(
          title: 'Trending Now',
          subtitle: 'Most popular topics this week',
        ),
        
        SizedBox(height: 20.h),
        
        // Atom Grid List
        const CardGridMediumWidth(),
        
        SizedBox(height: 16.h),
        
        // Atom DotCard (Posisi Start)
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: const DotCard(
            alignment: MainAxisAlignment.start,
          ),
        ),
      ],
    );
  }
}