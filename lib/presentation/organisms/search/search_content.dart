import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hadist_pedia/env/app_env.dart';
import 'package:hadist_pedia/presentation/common/utils/manager/cache_manager.dart';
import 'package:hadist_pedia/presentation/atom/shared/search_bar.dart';
import 'package:hadist_pedia/presentation/molecules/search/trending_search_section.dart';
import 'package:hadist_pedia/presentation/molecules/search/categories_section.dart';
import 'package:hadist_pedia/presentation/molecules/search/search_grid_section.dart';

class SearchContent extends StatefulWidget {
  const SearchContent({super.key});

  @override
  State<SearchContent> createState() => _SearchContentState();
}

class _SearchContentState extends State<SearchContent> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> _allItems = [];
  List<Map<String, dynamic>> _trendingItems = [];
  List<Map<String, dynamic>> _categoryItems = [];
  List<Map<String, dynamic>> _gridItems = [];
  List<Map<String, dynamic>> _filtered = [];
  bool _isSearching = false;
  bool _ready = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onSearch);
    _loadAll();
  }

  @override
  void dispose() {
    _controller.removeListener(_onSearch);
    _controller.dispose();
    super.dispose();
  }

  Future<void> _loadAll() async {
    final cache = CacheManager();
    final bukhari = await cache.loadList(AppEnv.hadistBukhariPath);
    final kudsi = await cache.loadList(AppEnv.hadistKudsiPath);
    final tabiin = await cache.loadList(AppEnv.storyTabiinPath);

    List<Map<String, dynamic>> all = [];
    Set<String> seenCategories = {};
    List<Map<String, dynamic>> catItems = [];
    List<Map<String, dynamic>> gridCatItems = [];

    void extract(List<dynamic> data, String jsonPath, String targetType) {
      for (int i = 0; i < data.length; i++) {
        final item = data[i] as Map<String, dynamic>;
        final book = item['book'] as Map<String, dynamic>?;
        final chapterName = book?['chapter_name']?.toString() ?? '';
        final chapterTranslated = book?['chapter_name_translated']?.toString() ?? '';
        final cats = (item['category'] as List<dynamic>?) ?? [];

        all.add({
          'title': chapterName,
          'chapterTranslated': chapterTranslated,
          'category': cats.map((e) => e.toString()).join(', '),
          'jsonPath': jsonPath,
          'index': i,
          'targetType': targetType,
        });

        for (final cat in cats) {
          final catStr = cat.toString();
          if (!seenCategories.contains(catStr)) {
            seenCategories.add(catStr);
            catItems.add({
              'title': catStr,
              'jsonPath': jsonPath,
              'index': i,
              'targetType': targetType,
            });
            gridCatItems.add({
              'title': catStr,
              'jsonPath': jsonPath,
              'index': i,
              'targetType': targetType,
            });
          }
        }
      }
    }

    extract(bukhari, AppEnv.hadistBukhariPath, 'hadist');
    extract(kudsi, AppEnv.hadistKudsiPath, 'hadist');
    extract(tabiin, AppEnv.storyTabiinPath, 'book');

    final slot = AppEnv.getCurrentRotationSlot();
    final trendingList = List<Map<String, dynamic>>.from(all)..shuffle(Random(slot + 200));
    final catList = List<Map<String, dynamic>>.from(catItems)..shuffle(Random(slot + 300));
    final gridList = List<Map<String, dynamic>>.from(gridCatItems)..shuffle(Random(slot + 400));

    if (mounted) {
      setState(() {
        _allItems = all;
        _trendingItems = trendingList.take(7).toList();
        _categoryItems = catList.take(10).toList();
        _gridItems = gridList.take(6).toList();
        _ready = true;
      });
    }
  }

  void _onSearch() {
    final query = _controller.text.trim().toLowerCase();
    if (query.isEmpty) {
      setState(() {
        _isSearching = false;
        _filtered = [];
      });
      return;
    }

    setState(() {
      _isSearching = true;
      _filtered = _allItems.where((item) {
        final chapter = item['title'].toString().toLowerCase();
        final translated = item['chapterTranslated'].toString().toLowerCase();
        final category = item['category'].toString().toLowerCase();
        return chapter.contains(query) || translated.contains(query) || category.contains(query);
      }).take(10).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_ready) {
      return SizedBox(
        height: 300.h,
        child: const Center(child: CircularProgressIndicator(color: Color(0xFFD4E99C))),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchBarWidget(controller: _controller),
        SizedBox(height: 36.h),
        if (_isSearching)
          _buildSearchResults()
        else ...[
          RepaintBoundary(child: TrendingSearchSection(items: _trendingItems)),
          SizedBox(height: 36.h),
          RepaintBoundary(child: SearchCategoriesSection(categories: _categoryItems)),
          SizedBox(height: 36.h),
          RepaintBoundary(child: SearchGridSection(items: _gridItems)),
        ],
      ],
    );
  }

  Widget _buildSearchResults() {
    if (_filtered.isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.only(top: 40.h),
          child: Text(
            'Tidak ditemukan',
            style: TextStyle(color: Colors.white54, fontSize: 16.sp),
          ),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _filtered.length,
      itemBuilder: (context, index) {
        final item = _filtered[index];
        return RepaintBoundary(
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 4.h),
            leading: Icon(
              item['targetType'] == 'book' ? Icons.menu_book_rounded : Icons.library_books_rounded,
              color: const Color(0xFFD4E99C),
              size: 24.sp,
            ),
            title: Text(
              item['title'] ?? '',
              style: TextStyle(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.w500),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              item['category'] ?? '',
              style: TextStyle(color: Colors.white54, fontSize: 12.sp),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () {
              final route = item['targetType'] == 'book' ? '/book' : '/hadist';
              context.push(route, extra: {
                'index': item['index'],
                'jsonPath': item['jsonPath'],
              });
            },
          ),
        );
      },
    );
  }
}
