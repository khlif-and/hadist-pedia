import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hadist_pedia/presentation/atom/shared/author.dart';

class AuthorSection extends StatelessWidget {
  final int index;
  final String jsonPath;
  const AuthorSection({
    Key? key,
    this.index = 0,
    this.jsonPath = 'lib/json/hadist_bukhari.json',
  }) : super(key: key);

  Future<Map<String, dynamic>> _loadAuthor() async {
    try {
      final String response = await rootBundle.loadString(jsonPath);
      final List<dynamic> data = json.decode(response);
      if (data.length > index) return data[index] as Map<String, dynamic>;
      return data[0] as Map<String, dynamic>;
    } catch (e) {
      return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: _loadAuthor(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData &&
            snapshot.data!.isNotEmpty) {
          final data = snapshot.data!;
          final type = data['type'] ?? 'Shahih';
          final author = data['author'] ?? {};
          return Author(
            status: type.toString(),
            author: author['known_as']?.toString() ?? '',
            fullNameArabic: author['full_name_arabic']?.toString(),
            fullName: author['full_name']?.toString(),
            additionalInfo1: author['born'] != null ? "Lahir: ${author['born']}" : null,
            additionalInfo2: author['died'] != null ? "Wafat: ${author['died']}" : null,
          );
        }
        return const Author(status: 'Memuat...', author: '...');
      },
    );
  }
}
