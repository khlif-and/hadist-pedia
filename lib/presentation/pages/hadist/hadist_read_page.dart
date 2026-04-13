import 'package:flutter/material.dart';
import 'package:hadist_pedia/presentation/organisms/home/bottom_sheet.dart';
import 'package:hadist_pedia/presentation/templates/hadist_template.dart';

class HadistReadPage extends StatelessWidget {
  final int index;
  final String jsonPath;

  const HadistReadPage({
    super.key,
    this.index = 0,
    this.jsonPath = 'lib/json/hadist_bukhari.json',
  });

  @override
  Widget build(BuildContext context) {
    return HadistTemplate(
      imageUrl: 'https://picsum.photos/800/600?random=$index',
      onBackPressed: () => Navigator.pop(context),
      bottomSheet: HadistBottomSheet(index: index, jsonPath: jsonPath),
    );
  }
}
