import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hadist_pedia/presentation/atom/shared/card_on_the_background.dart';
import 'package:hadist_pedia/presentation/atom/shared/header_header.dart';
import 'package:hadist_pedia/presentation/atom/shared/information_wv.dart';
import 'package:hadist_pedia/presentation/molecules/stories/history_note.dart';
import 'package:hadist_pedia/presentation/molecules/stories/reference_edition.dart';

class ContentDetailOrganism extends StatelessWidget {
  final int index;
  final String type;
  final String chapterName;
  final String knownAs;
  final String chapterNum;
  final String categoryFirst;
  final String pageNote;
  final String editionRef;

  const ContentDetailOrganism({
    super.key,
    required this.index,
    required this.type,
    required this.chapterName,
    required this.knownAs,
    required this.chapterNum,
    required this.categoryFirst,
    required this.pageNote,
    required this.editionRef,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderHeader(),
        SizedBox(height: 20.h),
        CardOnTheBackground(
          imageUrl: 'https://picsum.photos/400/400?random=$index',
        ),
        SizedBox(height: 32.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFD4E99C).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: const Color(0xFFD4E99C).withValues(alpha: 0.5),
                    width: 1,
                  ),
                ),
                child: Text(
                  type,
                  style: TextStyle(
                    color: const Color(0xFFD4E99C),
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                chapterName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Georgia',
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            knownAs,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.6),
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: 24.h),
        InformationWv(chapterNum: chapterNum, categoryFirst: categoryFirst),
        SizedBox(height: 32.h),
        HistoryNote(pageNote: pageNote),
        SizedBox(height: 24.h),
        ReferenceEdition(editionRef: editionRef),
      ],
    );
  }
}
