import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hadist_pedia/presentation/atom/background_home.dart';
import 'package:hadist_pedia/presentation/common/utils/constant/style.dart';
import 'package:hadist_pedia/presentation/molecules/chips_and_button.dart';
import 'package:hadist_pedia/presentation/organisms/card_group_card.dart';
import 'package:hadist_pedia/presentation/organisms/bottom_bar.dart';
import 'package:hadist_pedia/presentation/organisms/header.dart';
import 'package:hadist_pedia/presentation/organisms/trending_card_available.dart';
import 'package:hadist_pedia/presentation/molecules/card_grid_big_card.dart';

class HomeTemplate extends StatelessWidget {
  const HomeTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Stack(
        children: [
          const BackgroundHome(),
          SafeArea(
            bottom: false,
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
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
                    child: Container(
                      height: 56.h,
                      color: AppStyle.overlayDarkBackground,
                      alignment: Alignment.center,
                      child: const ChipsAndButton(),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: const CardGroupCard(),
                      ),
                      SizedBox(height: 20.h),
                      const TrendingCardAvailable(),
                      SizedBox(height: 20.h),
                      const CardGridBigCard(
                        jsonPath: 'lib/json/daily_picks.json',
                      ),
                      SizedBox(height: 120.h),
                    ]),
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
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_StickyChipsDelegate oldDelegate) => false;
}
