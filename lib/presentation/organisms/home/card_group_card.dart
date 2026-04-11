import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hadist_pedia/presentation/molecules/home/card_container_card.dart';

class CardGroupCard extends StatelessWidget {
  const CardGroupCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CardContainerCard(), // Memanggil Molecule dengan nama baru
        SizedBox(height: 24.h),
      ],
    );
  }
}
