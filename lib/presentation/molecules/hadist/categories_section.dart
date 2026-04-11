import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hadist_pedia/presentation/atom/hadist/info_card.dart';
import 'package:hadist_pedia/presentation/atom/shared/categories_row.dart';

class CategoriesSection extends StatelessWidget {
  final int index;
  final String jsonPath;
  const CategoriesSection({
    Key? key,
    this.index = 0,
    this.jsonPath = 'lib/json/hadist_bukhari.json',
  }) : super(key: key);

  Future<Map<String, dynamic>> _loadData() async {
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
      future: _loadData(),
      builder: (context, snapshot) {
        List<Widget> children = [];

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData &&
            snapshot.data!.isNotEmpty) {
          final data = snapshot.data!;
          final book = data['book'];
          final categories = data['category'] as List<dynamic>? ?? [];

          void addCard(String title, String? value) {
            if (value != null && value.isNotEmpty) {
              if (children.isNotEmpty) children.add(SizedBox(width: 12.w));
              children.add(InfoCard(title: title, value: value));
            }
          }

          if (book != null) {
            addCard('Kitab', book['chapter_name_translated']?.toString());
            addCard('Chapter', book['chapter_name']?.toString());
            addCard('Chapter (Ar)', book['chapter_name_arabic']?.toString());
            addCard('No. Chapter', book['chapter_number']?.toString());
            addCard('Volume', book['volume']?.toString());
            addCard('Halaman', book['page']?.toString());
          }

          if (categories.isNotEmpty) {
            addCard('Kategori', categories.join(', '));
          }
        } else {
          children = [
            const InfoCard(title: 'Kategori', value: 'Ilmu'),
            SizedBox(width: 12.w),
            const InfoCard(title: 'Perawi', value: 'Anas bin Malik'),
            SizedBox(width: 12.w),
            const InfoCard(title: 'Kitab', value: 'Sunan Ibnu Majah'),
          ];
        }

        return CategoriesRow(children: children);
      },
    );
  }
}
