import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hadist_pedia/presentation/common/utils/helpers/time_helper.dart';
import 'package:hadist_pedia/presentation/molecules/chips_and_button.dart';
import 'package:hadist_pedia/presentation/organisms/card_group_card.dart';
import 'package:hadist_pedia/presentation/organisms/bottom_bar.dart';
import 'package:hadist_pedia/presentation/organisms/header.dart';
import 'package:hadist_pedia/presentation/organisms/trending_card_available.dart';

class HomeTemplate extends StatelessWidget {
  const HomeTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              TimeHelper.getBackgroundImage(),
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 35.0, sigmaY: 35.0),
              child: Container(
                color: Colors.white.withOpacity(0.2),
              ),
            ),
          ),
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
                      color: Colors.transparent,
                      alignment: Alignment.center,
                      child: const ChipsAndButton(),
                    ),
                  ),
                ),

                // PERUBAHAN DI SINI
                SliverPadding(
                  // Hapus horizontal: 8.w agar konten bisa menyentuh pinggir layar
                  padding: EdgeInsets.symmetric(vertical: 20.h), 
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      // Beri padding manual hanya untuk CardGroupCard 
                      // agar kartu besar ini tetap tidak menempel ke pinggir
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: const CardGroupCard(),
                      ),
                      
                      SizedBox(height: 20.h),
                      
                      // TrendingCardAvailable sekarang bisa Edge-to-Edge 
                      // karena sudah tidak ditahan oleh SliverPadding di atas
                      const TrendingCardAvailable(),
                      
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
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }
  @override
  bool shouldRebuild(_StickyChipsDelegate oldDelegate) => false;
}