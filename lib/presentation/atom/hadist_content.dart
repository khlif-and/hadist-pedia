import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'expandables.dart';

class HadistContent extends StatelessWidget {
  final int index;
  const HadistContent({Key? key, this.index = 0}) : super(key: key);

  Future<Map<String, dynamic>> _loadData() async {
    try {
      final String response = await rootBundle.loadString('lib/json/hadist_bukhari.json');
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
            )
          );
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text("Data tidak ditemukan", style: TextStyle(color: Colors.white)));
        }

        final data = snapshot.data!;
        
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ARABIC
            Text(
              data['arabic'] ?? '',
              style: TextStyle(
                color: Colors.white, 
                fontSize: 26.sp, 
                height: 1.8, 
                fontFamily: 'Amiri', 
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
            ),
            SizedBox(height: 24.h),
            
            // LATIN
            if (data['latin'] != null)
              ExpandableText(label: 'Latin', text: data['latin']),
            SizedBox(height: 16.h),
            
            // TRANSLATION
            if (data['translation'] != null)
              ExpandableText(label: 'Terjemahan', text: data['translation']),
            SizedBox(height: 32.h),

            // MEANING (KANDUNGAN HADIST)
            if (data['meaning'] != null)
              _buildMeaningSection(data['meaning']),
              
            SizedBox(height: 24.h),

            // ASBAB AL-WURUD
            if (data['asbab_al_wurud'] != null)
              _buildAsbabAlWurudSection(data['asbab_al_wurud']),

            SizedBox(height: 24.h),

            // ISNAD (SANAD)
            if (data['isnad'] != null)
              _buildIsnadSection(data['isnad']),

            SizedBox(height: 24.h),

            // TAFSIR ULAMA
            if (data['tafsir'] != null && data['tafsir']['scholars'] != null)
              _buildTafsirSection(data['tafsir']['scholars']),

            SizedBox(height: 24.h),

            // RELEVANT AYAT
            if (data['relevant_ayat'] != null)
              _buildRelevantAyatSection(data['relevant_ayat']),
          ],
        );
      },
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFFD4E99C), size: 22.sp),
        SizedBox(width: 8.w),
        Text(
          title, 
          style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildMeaningSection(Map<String, dynamic> meaning) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Kandungan Hadist', Icons.lightbulb_outline),
        SizedBox(height: 12.h),
        if (meaning['overview'] != null)
           Text(meaning['overview'].toString(), style: TextStyle(color: Colors.white70, fontSize: 15.sp, height: 1.5)),
        SizedBox(height: 12.h),
        if (meaning['key_points'] != null)
           ...List<dynamic>.from(meaning['key_points']).map((point) => Padding(
             padding: EdgeInsets.only(bottom: 8.h),
             child: Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                  Text("• ", style: TextStyle(color: const Color(0xFFD4E99C), fontSize: 18.sp, fontWeight: FontWeight.bold)),
                  Expanded(
                    child: Text(point.toString(), style: TextStyle(color: Colors.white.withOpacity(0.85), fontSize: 14.sp, height: 1.4))
                  ),
               ],
             ),
           )).toList()
      ],
    );
  }

  Widget _buildAsbabAlWurudSection(Map<String, dynamic> asbab) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Asbab Al-Wurud', Icons.history_edu),
          SizedBox(height: 12.h),
          if (asbab['title'] != null)
            Text(asbab['title'], style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.bold)),
          if (asbab['summary'] != null)
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: Text(asbab['summary'], style: TextStyle(color: const Color(0xFFD4E99C), fontSize: 14.sp)),
            ),
          if (asbab['narrative'] != null)
            Padding(
               padding: EdgeInsets.only(top: 12.h),
               child: ExpandableText(label: 'Kisah', text: asbab['narrative']),
            ),
          if (asbab['scholarly_note'] != null)
            Padding(
               padding: EdgeInsets.only(top: 12.h),
               child: Container(
                 padding: EdgeInsets.all(12.w),
                 decoration: BoxDecoration(
                   color: Colors.black26, 
                   borderRadius: BorderRadius.circular(8.r), 
                   border: Border(left: BorderSide(color: const Color(0xFFD4E99C), width: 3.w))
                 ),
                 child: Text(
                   "Catatan Ulama: ${asbab['scholarly_note']}", 
                   style: TextStyle(color: Colors.white70, fontSize: 13.sp, fontStyle: FontStyle.italic)
                 ),
               )
            ),
        ],
      )
    );
  }

  Widget _buildIsnadSection(Map<String, dynamic> isnad) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Sanad Hadist', Icons.share_outlined),
        SizedBox(height: 8.h),
        if (isnad['chain_summary'] != null)
           Text("Jalur: ${isnad['chain_summary']}", style: TextStyle(color: Colors.white70, fontSize: 14.sp, height: 1.5)),
        if (isnad['chain_length'] != null)
           Text("Panjang Sanad: ${isnad['chain_length']} perawi", style: TextStyle(color: const Color(0xFFD4E99C), fontSize: 14.sp, fontWeight: FontWeight.w600)),
        SizedBox(height: 16.h),
        if (isnad['narrators'] != null)
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: isnad['narrators'].length,
            itemBuilder: (context, index) {
              final n = isnad['narrators'][index];
              return Container(
                margin: EdgeInsets.only(bottom: 12.h),
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                   color: Colors.white.withOpacity(0.04),
                   borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "${n['level']}. ${n['name'] ?? ''}", 
                            style: TextStyle(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.bold)
                          )
                        ),
                        if (n['name_arabic'] != null)
                           Text(
                             n['name_arabic'], 
                             style: TextStyle(color: const Color(0xFFD4E99C), fontSize: 16.sp, fontFamily: 'Amiri')
                           ),
                      ],
                    ),
                    SizedBox(height: 6.h),
                    if (n['role'] != null)
                      Text("Peran: ${n['role']}", style: TextStyle(color: Colors.white70, fontSize: 13.sp)),
                    if (n['status'] != null)
                      Text("Status: ${n['status']}", style: TextStyle(color: Colors.white70, fontSize: 13.sp)),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        if (n['born'] != null) 
                          Expanded(child: Text("Lahir: ${n['born']}", style: TextStyle(color: Colors.white54, fontSize: 12.sp))),
                        if (n['died'] != null) 
                          Expanded(child: Text("Wafat: ${n['died']}", style: TextStyle(color: Colors.white54, fontSize: 12.sp))),
                      ],
                    )
                  ],
                ),
              );
            }
          )
      ],
    );
  }

  Widget _buildTafsirSection(List<dynamic> scholars) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Tafsir Ulama', Icons.menu_book),
        SizedBox(height: 12.h),
        ...scholars.map((s) => Container(
          margin: EdgeInsets.only(bottom: 12.h),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Colors.white.withOpacity(0.05)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                s['scholar'] ?? '', 
                style: TextStyle(color: const Color(0xFFD4E99C), fontSize: 15.sp, fontWeight: FontWeight.bold)
              ),
              if (s['work'] != null)
                 Text("Kitab: ${s['work']}", style: TextStyle(color: Colors.white70, fontSize: 13.sp, fontStyle: FontStyle.italic)),
              SizedBox(height: 8.h),
              if (s['explanation'] != null)
                 Text(s['explanation'], style: TextStyle(color: Colors.white.withOpacity(0.85), fontSize: 14.sp, height: 1.5)),
            ],
          ),
        )).toList(),
      ],
    );
  }

  Widget _buildRelevantAyatSection(List<dynamic> ayats) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         _buildSectionTitle('Ayat Relevan', Icons.auto_stories),
         SizedBox(height: 12.h),
         ...ayats.map((a) => Container(
            margin: EdgeInsets.only(bottom: 16.h),
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
               color: Colors.black26,
               borderRadius: BorderRadius.circular(16.r),
               border: Border.all(color: const Color(0xFFD4E99C).withOpacity(0.3)),
            ),
            child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Text(
                         "${a['surah']} (${a['surah_number']}:${a['ayah_number']})", 
                         style: TextStyle(color: const Color(0xFFD4E99C), fontSize: 14.sp, fontWeight: FontWeight.bold)
                       ),
                       Icon(Icons.bookmark, color: const Color(0xFFD4E99C).withOpacity(0.5), size: 16.sp),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  if (a['arabic'] != null)
                     Align(
                       alignment: Alignment.centerRight,
                       child: Text(
                         a['arabic'], 
                         style: TextStyle(color: Colors.white, fontSize: 20.sp, fontFamily: 'Amiri', height: 1.8), 
                         textAlign: TextAlign.right, 
                         textDirection: TextDirection.rtl
                       ),
                     ),
                  SizedBox(height: 8.h),
                  if (a['translation'] != null)
                     Text(
                       a['translation'], 
                       style: TextStyle(color: Colors.white.withOpacity(0.85), fontSize: 14.sp, height: 1.5, fontStyle: FontStyle.italic)
                     ),
                  if (a['relevance'] != null)
                     Padding(
                        padding: EdgeInsets.only(top: 12.h),
                        child: Text(
                          "Relevansi: ${a['relevance']}", 
                          style: TextStyle(color: Colors.white70, fontSize: 13.sp, height: 1.4)
                        ),
                     )
               ],
            ),
         )).toList(),
      ],
    );
  }
}
