import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hadist_pedia/presentation/molecules/home/card_grid_big_card.dart';

class DynamicHomeFeed extends StatelessWidget {
  const DynamicHomeFeed({Key? key}) : super(key: key);

  Future<List<dynamic>> _loadPool() async {
    try {
      final String response = await rootBundle.loadString('lib/json/home_pool_cards.json');
      return json.decode(response) as List<dynamic>;
    } catch (e) {
      return [];
    }
  }

List<String> _generateDynamicTitles(int dayOfYear, DateTime now) {
    List<String> titles = [];
    
    if (now.hour >= 3 && now.hour < 11) {
      titles.add("Semangat Pagi");
    } else if (now.hour >= 11 && now.hour < 15) {
      titles.add("Pengingat Siang");
    } else if (now.hour >= 15 && now.hour < 18) {
      titles.add("Sore Penuh Berkah");
    } else {
      titles.add("Renungan Malam");
    }

    if (now.weekday == DateTime.friday) {
      titles.add("✨ Jumat Berkah");
    } else if (now.weekday == DateTime.monday) {
      titles.add("🔥 Semangat Senin");
    } else {
      final randomTitles = [
        "Hadist Buat Kamu",
        "Pilihan Hari Ini",
        "Kisah Penyejuk Hati",
        "Top Highlight",
        "Inspirasi Tabi'in"
      ];
      titles.add(randomTitles[dayOfYear % randomTitles.length]);
    }

    titles.add("Mungkin Kamu Suka");
    titles.add("Hadits Pilihan Minggu Ini");
    titles.add("Untuk Ketenangan Hati");
    
    return titles;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: _loadPool(),
      builder: (context, snapshot) {
         if (snapshot.connectionState == ConnectionState.waiting) {
           return Padding(
             padding: EdgeInsets.only(top: 50.h),
             child: const Center(child: CircularProgressIndicator(color: Color(0xFFD4E99C))),
           );
         }
         
         final rawPool = snapshot.data ?? [];
         if (rawPool.isEmpty) {
           return Center(child: Text("Data Pool Kosong", style: TextStyle(color: Colors.white)));
         }

         DateTime now = DateTime.now();
         int dayOfYear = now.difference(DateTime(now.year, 1, 1)).inDays;

         // Deterministic Shuffle: Feed tetap sama dalam satu hari
         final random = Random(now.year * 1000 + dayOfYear);
         List<dynamic> pool = List.from(rawPool)..shuffle(random);

         // Generate Judul
         List<String> titles = _generateDynamicTitles(dayOfYear, now);

         List<Widget> sections = [];
         int sliceSize = 5; // Tampilkan max 5 card per section
         int startIndex = 0;

         for (int i = 0; i < titles.length; i++) {
           if (startIndex >= pool.length) break; // Berhenti jika kartu di pool habis
           
           int endIdx = startIndex + sliceSize;
           if (endIdx > pool.length) endIdx = pool.length;

           var subsetItems = pool.sublist(startIndex, endIdx);
           
           sections.add(
             CardGridBigCard(
               title: titles[i],
               items: subsetItems,
             )
           );
           sections.add(SizedBox(height: 30.h));
           startIndex = endIdx; // Lanjut ke potongan pool berikutnya
         }

         return Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: sections,
         );
      }
    );
  }
}
