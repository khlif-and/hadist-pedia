// C:\Users\khali\Documents\android\hadist_pedia\lib\presentation\organisms\player_play.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hadist_pedia/presentation/atom/button_player_button.dart';
import 'package:hadist_pedia/presentation/atom/head_title_and_total.dart';
import 'package:hadist_pedia/presentation/atom/headline_player.dart';
import 'package:hadist_pedia/presentation/atom/line_stamp_player.dart';
import 'package:hadist_pedia/presentation/atom/time_stamp_player.dart';

class PlayerPlay extends StatelessWidget {
  const PlayerPlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(height: 40.h),
          const HeadlinePlayer(),
          SizedBox(height: 16.h),
          const HeadTitleAndTotal(),
          const Spacer(),
          const TimeStampPlayer(),
          const Spacer(),
          const ButtonPlayerButton(),
          SizedBox(height: 40.h),
          const LineStampPlayer(),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}