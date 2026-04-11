import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hadist_pedia/presentation/atom/hadist/section_title.dart';
import 'package:hadist_pedia/presentation/molecules/hadist/asbabul_wurud.dart';
import 'package:hadist_pedia/presentation/molecules/hadist/isnad_hadist.dart';
import 'package:hadist_pedia/presentation/molecules/hadist/tafsir_hadist.dart';
import 'package:hadist_pedia/presentation/molecules/hadist/meaning_hadist.dart';
import 'package:hadist_pedia/presentation/molecules/hadist/relevant_ayah.dart';
import '../../atom/shared/expandables.dart';

class HadistContent extends StatelessWidget {
  final int index;
  final String jsonPath;

  const HadistContent({
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
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 32.h),
              child: const CircularProgressIndicator(color: Color(0xFFD4E99C)),
            ),
          );
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text(
              "Data tidak ditemukan",
              style: TextStyle(color: Colors.white),
            ),
          );
        }

        final data = snapshot.data!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (data['arabic'] != null)
              ExpandableText(
                label: 'Teks Arab',
                text: data['arabic'],
                isArabic: true,
              ),
            SizedBox(height: 24.h),
            if (data['latin'] != null)
              ExpandableText(label: 'Latin', text: data['latin']),
            SizedBox(height: 16.h),
            if (data['translation'] != null)
              ExpandableText(label: 'Terjemahan', text: data['translation']),
            SizedBox(height: 32.h),
            if (data['meaning'] != null)
              MeaningHadist(meaning: data['meaning']),
            SizedBox(height: 24.h),
            if (data['asbab_al_wurud'] != null)
              AsbabulWurud(asbab: data['asbab_al_wurud']),
            SizedBox(height: 24.h),
            if (data['isnad'] != null) IsnadHadist(isnad: data['isnad']),
            SizedBox(height: 24.h),
            if (data['tafsir'] != null && data['tafsir']['scholars'] != null)
              TafsirHadist(scholars: data['tafsir']['scholars']),
            SizedBox(height: 24.h),
            if (data['relevant_ayat'] != null)
              RelevantAyah(ayats: data['relevant_ayat']),
          ],
        );
      },
    );
  }
}
