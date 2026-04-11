import 'package:flutter/material.dart';
import 'package:hadist_pedia/presentation/common/utils/constant/style.dart';
import 'package:hadist_pedia/presentation/common/utils/helpers/time_helper.dart';

class BackgroundHome extends StatelessWidget {
  const BackgroundHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            TimeHelper.getBackgroundImage(),
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: AppStyle.blurBackground,
            child: Container(
              color: AppStyle.overlayDarkBackground,
            ),
          ),
        ],
      ),
    );
  }
}