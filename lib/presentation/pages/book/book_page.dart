import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookPage extends StatelessWidget {
  final int index;
  final String jsonPath;

  const BookPage({
    Key? key,
    this.index = 0,
    this.jsonPath = 'lib/json/story_tabiin.json',
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
          return const Scaffold(
            backgroundColor: Color(0xFF13131A),
            body: Center(child: CircularProgressIndicator(color: Color(0xFFD4E99C))),
          );
        }

        final data = snapshot.data ?? {};
        final book = data['book'] ?? {};
        final author = data['author'] ?? {};

        final chapterName = book['chapter_name']?.toString() ?? 'Tanpa Judul';
        final knownAs = author['known_as']?.toString() ?? 'Tanpa Penulis';
        final type = data['type']?.toString() ?? 'Riwayat';
        final pageNote = book['page_note']?.toString() ?? '';
        final editionRef = book['edition_reference']?.toString() ?? '';
        final chapterNum = book['chapter_number']?.toString() ?? '1';

        final categoryList = data['category'] as List<dynamic>? ?? [];
        final categoryFirst = categoryList.isNotEmpty ? categoryList.first.toString() : 'Umum';

        return Scaffold(
          backgroundColor: const Color(0xFF13131A),
          body: Stack(
            children: [
              Positioned.fill(
                child: Image.network(
                  'https://picsum.photos/800/1000?random=$index',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            const Color(0xFF13131A),
                            const Color(0xFF13131A).withOpacity(0.95),
                            const Color(0xFF13131A).withOpacity(0.85),
                          ],
                          stops: const [0.0, 0.5, 1.0],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SafeArea(
                bottom: false,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.only(bottom: 120.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white.withOpacity(0.15),
                              radius: 22.r,
                              child: IconButton(
                                icon: const Icon(Icons.arrow_back, color: Colors.white),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ),
                            const Spacer(),
                            CircleAvatar(
                              backgroundColor: Colors.white.withOpacity(0.15),
                              radius: 22.r,
                              child: IconButton(
                                icon: const Icon(Icons.bookmark, color: Colors.white),
                                onPressed: () {},
                              ),
                            ),
                            SizedBox(width: 12.w),
                            CircleAvatar(
                              backgroundColor: Colors.white.withOpacity(0.15),
                              radius: 22.r,
                              child: IconButton(
                                icon: const Icon(Icons.more_vert, color: Colors.white),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Center(
                        child: Container(
                          width: 280.w,
                          height: 280.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                blurRadius: 30,
                                offset: const Offset(0, 15),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(32.r),
                            child: Image.network(
                              'https://picsum.photos/400/400?random=$index',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 32.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
                              decoration: BoxDecoration(
                                color: const Color(0xFFD4E99C).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20.r),
                                border: Border.all(
                                  color: const Color(0xFFD4E99C).withOpacity(0.5),
                                  width: 1,
                                ),
                              ),
                              child: Text(
                                type,
                                style: TextStyle(
                                  color: const Color(0xFFD4E99C),
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              chapterName,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26.sp,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Georgia',
                                height: 1.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Text(
                          knownAs,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Row(
                          children: [
                            _buildStatItem(Icons.menu_book, 'Bab $chapterNum', iconColor: const Color(0xFFD4E99C)),
                            SizedBox(width: 24.w),
                            _buildStatItem(Icons.label_outline, categoryFirst),
                            SizedBox(width: 24.w),
                            _buildStatItem(Icons.library_books, 'Riwayat Classic'),
                          ],
                        ),
                      ),
                      SizedBox(height: 32.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Text(
                          'Catatan Sejarah',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Text(
                          pageNote,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.85),
                            fontSize: 15.sp,
                            height: 1.6,
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Text(
                          'Referensi Edisi',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Container(
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(color: Colors.white.withOpacity(0.1)),
                          ),
                          child: Text(
                            editionRef,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 14.sp,
                              height: 1.5,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.only(
                    left: 24.w,
                    right: 24.w,
                    top: 20.h,
                    bottom: MediaQuery.of(context).padding.bottom + 20.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF13131A),
                    border: Border(
                      top: BorderSide(
                        color: Colors.white.withOpacity(0.08),
                        width: 1,
                      ),
                    ),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 60.h,
                    child: ElevatedButton(
                      onPressed: () {
                         // Ketika ditap akan lanjut baca ke halaman hadist content / story content
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFAF1A2),
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Mulai Membaca',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStatItem(IconData icon, String value, {Color? iconColor}) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor ?? Colors.white.withOpacity(0.5),
          size: 18.sp,
        ),
        SizedBox(width: 6.w),
        Text(
          value,
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}