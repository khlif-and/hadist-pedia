// C:\Users\khali\Documents\android\hadist_pedia\lib\presentation\atom\head_title_and_total.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeadTitleAndTotal extends StatelessWidget {
  const HeadTitleAndTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Calm Sounds  •  45 min',
      style: TextStyle(
        fontSize: 14.sp,
        color: Colors.white.withOpacity(0.7),
      ),
    );
  }
}