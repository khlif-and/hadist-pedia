import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hadist_pedia/presentation/atom/home/container_big_card.dart';
import 'package:hadist_pedia/presentation/atom/home/dot_card.dart';
import 'package:hadist_pedia/presentation/atom/home/headline_card.dart';
import 'package:hadist_pedia/presentation/atom/home/card_grid_medium_height.dart';

class CardContainerCard extends StatelessWidget {
  const CardContainerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: ContainerBigCard(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const HeadlineCard(),
            SizedBox(height: 30.h),
            const CardGridMediumHeight(),
            SizedBox(height: 24.h),
            const DotCard(),
          ],
        ),
      ),
    );
  }
}
