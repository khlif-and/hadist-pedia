import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hadist_pedia/presentation/common/utils/manager/cache_manager.dart';
import 'package:hadist_pedia/presentation/templates/book_stories_template.dart';

class BookPage extends StatelessWidget {
  final int index;
  final String jsonPath;

  const BookPage({
    super.key,
    this.index = 0,
    this.jsonPath = 'lib/json/story_tabiin.json',
  });

  Future<Map<String, dynamic>> _loadData() async {
    return CacheManager().loadListItem(jsonPath, index);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: _loadData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            backgroundColor: Color(0xFF13131A),
            body: Center(
              child: CircularProgressIndicator(color: Color(0xFFD4E99C)),
            ),
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
        final categoryFirst = categoryList.isNotEmpty
            ? categoryList.first.toString()
            : 'Umum';

        return BookStoriesTemplate(
          index: index,
          type: type,
          chapterName: chapterName,
          knownAs: knownAs,
          chapterNum: chapterNum,
          categoryFirst: categoryFirst,
          pageNote: pageNote,
          editionRef: editionRef,
          onReadPressed: () {
            context.push(
              '/stories_book',
              extra: {'index': index, 'jsonPath': jsonPath},
            );
          },
        );
      },
    );
  }
}
