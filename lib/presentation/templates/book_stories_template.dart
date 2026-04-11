import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hadist_pedia/presentation/atom/shared/background_on_the_background.dart';
import 'package:hadist_pedia/presentation/atom/shared/button_and_box.dart';
import 'package:hadist_pedia/presentation/organisms/stories/book_detail_organism.dart';

class BookStoriesTemplate extends StatelessWidget {
  final int index;
  final String type;
  final String chapterName;
  final String knownAs;
  final String chapterNum;
  final String categoryFirst;
  final String pageNote;
  final String editionRef;
  final VoidCallback onReadPressed;

  const BookStoriesTemplate({
    Key? key,
    required this.index,
    required this.type,
    required this.chapterName,
    required this.knownAs,
    required this.chapterNum,
    required this.categoryFirst,
    required this.pageNote,
    required this.editionRef,
    required this.onReadPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF13131A),
      body: Stack(
        children: [
          Positioned.fill(
            child: BackgroundOnTheBackground(
              imageUrl: 'https://picsum.photos/800/1000?random=$index',
            ),
          ),
          SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(bottom: 120.h),
              child: BookDetailOrganism(
                index: index,
                type: type,
                chapterName: chapterName,
                knownAs: knownAs,
                chapterNum: chapterNum,
                categoryFirst: categoryFirst,
                pageNote: pageNote,
                editionRef: editionRef,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ButtonAndBox(onPressed: onReadPressed),
          ),
        ],
      ),
    );
  }
}
