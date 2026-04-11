// C:\Users\khali\Documents\android\hadist_pedia\lib\presentation\templates\player_template.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hadist_pedia/presentation/atom/dzikr/background_player.dart';
import 'package:hadist_pedia/presentation/atom/shared/kebab_player.dart';
import 'package:hadist_pedia/presentation/organisms/player_play.dart';

class PlayerTemplate extends StatelessWidget {
  const PlayerTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          const BackgroundPlayer(),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      KebabPlayer(
                        icon: Icons.arrow_back_ios_new_rounded,
                        onTap: () => context.pop(),
                      ),
                      const KebabPlayer(icon: Icons.more_horiz),
                    ],
                  ),
                  const PlayerPlay(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
