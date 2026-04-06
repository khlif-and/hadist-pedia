import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hadist_pedia/presentation/atom/container_big_card.dart';
import 'package:hadist_pedia/presentation/atom/dot_card.dart';
import 'package:hadist_pedia/presentation/atom/headline_card.dart';
import 'package:hadist_pedia/presentation/atom/card_grid_medium_height.dart'; // Import atom baru

class CardContainerCard extends StatelessWidget {
  const CardContainerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerBigCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const HeadlineCard(),
          SizedBox(height: 30.h),
          
          // Menggunakan Atom yang baru dipisahkan
          const CardGridMediumHeight(),
          
          SizedBox(height: 24.h),
          const DotCard(),
        ],
      ),
    );
  }
}