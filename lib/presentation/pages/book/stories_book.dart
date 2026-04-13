import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hadist_pedia/presentation/common/utils/manager/cache_manager.dart';
import 'package:hadist_pedia/presentation/templates/hadist_template.dart';
import 'package:hadist_pedia/presentation/atom/shared/bottom_sheet.dart';
import 'package:hadist_pedia/presentation/atom/hadist/card_litte_container.dart';
import 'package:hadist_pedia/presentation/atom/shared/headline.dart';
import 'package:hadist_pedia/presentation/atom/shared/categories_row.dart';
import 'package:hadist_pedia/presentation/atom/shared/author.dart';
import 'package:hadist_pedia/presentation/atom/hadist/info_card.dart';
import 'package:hadist_pedia/presentation/atom/shared/expandables.dart';

class StoriesBookPage extends StatelessWidget {
  final int index;
  final String jsonPath;

  const StoriesBookPage({
    super.key,
    this.index = 0,
    this.jsonPath = 'lib/json/story_tabiin.json',
  });

  Future<Map<String, dynamic>> _loadData() async {
    return CacheManager().loadListItem(jsonPath, index);
  }

  @override
  Widget build(BuildContext context) {
    return HadistTemplate(
      imageUrl: 'https://picsum.photos/800/1000?random=$index',
      onBackPressed: () {
        Navigator.pop(context);
      },
      bottomSheet: FutureBuilder<Map<String, dynamic>>(
        future: _loadData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return AppBottomSheet(
              children: const [
                Center(
                  child: CircularProgressIndicator(color: Color(0xFFD4E99C)),
                ),
              ],
            );
          }

          final data = snapshot.data ?? {};
          if (data.isEmpty) {
            return AppBottomSheet(
              children: const [
                Center(
                  child: Text(
                    'Data tidak ditemukan',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            );
          }

          final book = data['book'] ?? {};
          final authorData = data['author'] ?? {};
          final categories = data['category'] as List<dynamic>? ?? [];
          final meaning = data['meaning'] ?? {};
          final tafsirScholars =
              (data['tafsir'] ?? {})['scholars'] as List<dynamic>? ?? [];
          final relevantAyat = data['relevant_ayat'] as List<dynamic>? ?? [];

          List<Widget> catChildren = [];
          void addCard(String title, String? value) {
            if (value != null && value.isNotEmpty) {
              if (catChildren.isNotEmpty)
                catChildren.add(SizedBox(width: 12.w));
              catChildren.add(InfoCard(title: title, value: value));
            }
          }

          addCard('No. Chapter', book['chapter_number']?.toString());
          addCard('Volume', book['volume']?.toString());
          addCard('Page', book['page']?.toString());
          addCard('Edition Ref', book['edition_reference']?.toString());
          if (categories.isNotEmpty) addCard('Kategori', categories.join(', '));

          return AppBottomSheet(
            children: [
              Headline(text: book['chapter_name']?.toString() ?? 'Tanpa Judul'),
              SizedBox(height: 24.h),

              Author(
                status: data['type']?.toString() ?? 'Riwayat',
                author: authorData['known_as']?.toString() ?? 'Tanpa Nama',
                fullNameArabic: authorData['full_name_arabic']?.toString(),
                fullName: authorData['full_name']?.toString(),
                additionalInfo1: authorData['born'] != null
                    ? "Lahir: ${authorData['born']}"
                    : null,
                additionalInfo2: authorData['died'] != null
                    ? "Wafat: ${authorData['died']}"
                    : null,
              ),
              SizedBox(height: 24.h),

              CategoriesRow(
                children: catChildren.isNotEmpty
                    ? catChildren
                    : [const InfoCard(title: '-', value: '-')],
              ),

              SizedBox(height: 32.h),
              ExpandableText(
                label: 'Kisah',
                text: data['story']?.toString() ?? '',
              ),

              SizedBox(height: 24.h),
              CardLittleContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sumber (Source)',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      data['source']?.toString() ?? '',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14.sp,
                        height: 1.5,
                      ),
                    ),
                    if (book['page_note'] != null) ...[
                      SizedBox(height: 12.h),
                      Text(
                        'Catatan Halaman:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        book['page_note'].toString(),
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 13.sp,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ],
                ),
              ),

              if (meaning.isNotEmpty) ...[
                SizedBox(height: 32.h),
                Text(
                  'Makna Kisah',
                  style: TextStyle(
                    color: const Color(0xFFD4E99C),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12.h),
                CardLittleContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Overview',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        meaning['overview']?.toString() ?? '',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14.sp,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'Key Points:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      ...(meaning['key_points'] as List<dynamic>? ?? []).map((
                        point,
                      ) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '• ',
                                style: TextStyle(
                                  color: const Color(0xFFD4E99C),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  point.toString(),
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 15.sp,
                                    height: 1.4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ],

              if (tafsirScholars.isNotEmpty) ...[
                SizedBox(height: 32.h),
                Text(
                  'Penjelasan Ulama',
                  style: TextStyle(
                    color: const Color(0xFFD4E99C),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12.h),
                ...tafsirScholars.map((scholar) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: CardLittleContainer(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            scholar['scholar']?.toString() ?? '',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            scholar['work']?.toString() ?? '',
                            style: TextStyle(
                              color: const Color(0xFFD4E99C),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            scholar['explanation']?.toString() ?? '',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14.sp,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ],

              if (relevantAyat.isNotEmpty) ...[
                SizedBox(height: 32.h),
                Text(
                  'Ayat yang Relevan',
                  style: TextStyle(
                    color: const Color(0xFFD4E99C),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12.h),
                ...relevantAyat.map((ayat) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: CardLittleContainer(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${ayat['surah']} (${ayat['surah_number']}:${ayat['ayah_number']})",
                            style: TextStyle(
                              color: const Color(0xFFD4E99C),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              ayat['arabic']?.toString() ?? '',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.sp,
                                fontFamily: 'Amiri',
                                height: 1.8,
                              ),
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            ayat['translation']?.toString() ?? '',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 15.sp,
                              height: 1.5,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Container(
                            padding: EdgeInsets.all(12.w),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.05),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Relevansi:',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  ayat['relevance']?.toString() ?? '',
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 14.sp,
                                    height: 1.4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ],

              SizedBox(height: 48.h),
            ],
          );
        },
      ),
    );
  }
}
