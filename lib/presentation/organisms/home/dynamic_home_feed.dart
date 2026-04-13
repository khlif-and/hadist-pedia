import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hadist_pedia/data/feed_engine.dart';
import 'package:hadist_pedia/presentation/molecules/home/card_grid_big_card.dart';

class DynamicHomeFeed extends StatelessWidget {
  const DynamicHomeFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<FeedSection>>(
      future: FeedEngine().generateSections(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Padding(
            padding: EdgeInsets.only(top: 50.h),
            child: const Center(child: CircularProgressIndicator(color: Color(0xFFD4E99C))),
          );
        }

        final sections = snapshot.data ?? [];
        if (sections.isEmpty) {
          return Center(
            child: Text(
              'Data Pool Kosong',
              style: TextStyle(color: Colors.white, fontSize: 14.sp),
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: sections.map((section) {
            return Padding(
              padding: EdgeInsets.only(bottom: 30.h),
              child: CardGridBigCard(
                title: section.title,
                items: section.items,
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
