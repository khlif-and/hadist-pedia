import 'package:flutter/material.dart';
import 'package:hadist_pedia/presentation/organisms/bottom_sheet.dart';
import 'package:hadist_pedia/presentation/templates/hadist_template.dart';

class HadistPage extends StatelessWidget {
  final int index;
  const HadistPage({Key? key, this.index = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HadistTemplate(
      imageUrl: 'https://picsum.photos/800/600',
      onBackPressed: () {
        Navigator.pop(context);
      },
      bottomSheet: HadistBottomSheet(index: index),
    );
  }
}
