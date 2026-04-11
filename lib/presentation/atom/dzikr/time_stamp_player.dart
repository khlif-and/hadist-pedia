// C:\Users\khali\Documents\android\hadist_pedia\lib\presentation\atom\time_stamp_player.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeStampPlayer extends StatelessWidget {
  const TimeStampPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '1:28',
      style: TextStyle(
        fontSize: 72.sp,
        fontWeight: FontWeight.w300,
        color: Colors.white,
        letterSpacing: 2,
      ),
    );
  }
}