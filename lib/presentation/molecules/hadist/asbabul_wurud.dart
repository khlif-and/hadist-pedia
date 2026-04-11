import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hadist_pedia/presentation/atom/shared/expandables.dart';
import 'package:hadist_pedia/presentation/atom/hadist/card_litte_container.dart';
import 'package:hadist_pedia/presentation/atom/hadist/side_border_card.dart';
import 'package:hadist_pedia/presentation/atom/hadist/section_title.dart';

class AsbabulWurud extends StatelessWidget {
  final Map<String, dynamic> asbab;

  const AsbabulWurud({Key? key, required this.asbab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardLittleContainer(
      margin: EdgeInsets.only(bottom: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: 'Asbab Al-Wurud'),
          SizedBox(height: 12.h),
          if (asbab['title'] != null)
            Text(
              asbab['title'],
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          if (asbab['summary'] != null)
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: Text(
                asbab['summary'],
                style: TextStyle(
                  color: const Color(0xFFD4E99C),
                  fontSize: 14.sp,
                ),
              ),
            ),
          if (asbab['narrative'] != null)
            Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: ExpandableText(label: 'Kisah', text: asbab['narrative']),
            ),
          if (asbab['scholarly_note'] != null)
            Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: SideBorderCard(
                backgroundColor: Colors.black26,
                borderColor: const Color(0xFFD4E99C),
                child: Text(
                  "Catatan Ulama: ${asbab['scholarly_note']}",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13.sp,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
