import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeadlineHadist extends StatelessWidget {
  final String title;
  final int index;
  final String jsonPath;

  const HeadlineHadist({Key? key, required this.title, this.index = 0, this.jsonPath = 'lib/json/hadist_bukhari.json'}) : super(key: key);

  Future<String> _loadChapterName() async {
    try {
      final String response = await rootBundle.loadString(jsonPath);
      final List<dynamic> data = json.decode(response);
      if (data.length > index) return data[index]['book']['chapter_name_translated'];
      return data[0]['book']['chapter_name_translated'];
    } catch (e) {
      return title;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _loadChapterName(),
      builder: (context, snapshot) {
        String displayText = title;
        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          displayText = snapshot.data!;
        }

        return Text(
          displayText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 28.sp,
            fontWeight: FontWeight.w500,
            height: 1.3,
          ),
        );
      },
    );
  }
}
