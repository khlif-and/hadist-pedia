import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hadist_pedia/presentation/molecules/card_grid_content_without_card.dart';

class TrendingCardAvailable extends StatelessWidget {
  const TrendingCardAvailable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CardGridContentWithoutCard(),
        SizedBox(height: 24.h), // Spacing antar section di level organism
      ],
    );
  }
}