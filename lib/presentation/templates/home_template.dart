import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hadist_pedia/presentation/atom/home/background_home.dart';
import 'package:hadist_pedia/presentation/common/utils/engine/feed_engine.dart';
import 'package:hadist_pedia/presentation/molecules/home/chips_and_button.dart';
import 'package:hadist_pedia/presentation/organisms/home/card_group_card.dart';
import 'package:hadist_pedia/presentation/organisms/home/bottom_bar.dart';
import 'package:hadist_pedia/presentation/organisms/home/header.dart';
import 'package:hadist_pedia/presentation/organisms/home/trending_card_available.dart';
import 'package:hadist_pedia/presentation/organisms/home/dynamic_home_feed.dart';

class HomeTemplate extends StatelessWidget {
  const HomeTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Stack(
        children: [
          const BackgroundHome(),
          SafeArea(
            bottom: false,
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              cacheExtent: 500,
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: const Header(),
                      ),
                      SizedBox(height: 30.h),
                    ],
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _StickyChipsDelegate(
                    child: const ChipsAndButton(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: const CardGroupCard(),
                        ),
                        SizedBox(height: 20.h),
                        FeedSectionRow(sectionLoader: () => FeedEngine().getTrendingSection()),
                        SizedBox(height: 20.h),
                        const DynamicHomeFeed(),
                        SizedBox(height: 120.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}

class _StickyChipsDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  _StickyChipsDelegate({required this.child});

  @override
  double get minExtent => 56.h;
  @override
  double get maxExtent => 56.h;
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_StickyChipsDelegate oldDelegate) => false;
}
