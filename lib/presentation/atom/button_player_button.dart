// C:\Users\khali\Documents\android\hadist_pedia\lib\presentation\atom\button_player_button.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonPlayerButton extends StatelessWidget {
  const ButtonPlayerButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.replay_10_rounded,
            color: Colors.white,
            size: 32.w,
          ),
        ),
        SizedBox(width: 40.w),
        Container(
          width: 80.w,
          height: 80.w,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.pause_rounded,
            color: Colors.black,
            size: 40.w,
          ),
        ),
        SizedBox(width: 40.w),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.forward_10_rounded,
            color: Colors.white,
            size: 32.w,
          ),
        ),
      ],
    );
  }
}