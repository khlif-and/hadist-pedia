import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:hadist_pedia/presentation/atom/shared/headline.dart';

class HeadlineSection extends StatelessWidget {
  final String defaultTitle;
  final int index;
  final String jsonPath;

  const HeadlineSection({
    Key? key,
    required this.defaultTitle,
    this.index = 0,
    this.jsonPath = 'lib/json/hadist_bukhari.json',
  }) : super(key: key);

  Future<String> _loadChapterName() async {
    try {
      final String response = await rootBundle.loadString(jsonPath);
      final List<dynamic> data = json.decode(response);
      if (data.length > index) return data[index]['book']['chapter_name_translated'];
      return data[0]['book']['chapter_name_translated'];
    } catch (e) {
      return defaultTitle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _loadChapterName(),
      builder: (context, snapshot) {
        String displayText = defaultTitle;
        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          displayText = snapshot.data!;
        }

        return Headline(text: displayText);
      },
    );
  }
}
