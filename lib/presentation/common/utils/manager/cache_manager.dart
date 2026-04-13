import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:hadist_pedia/presentation/common/utils/database/app_database.dart';

class CacheManager {
  static final CacheManager _instance = CacheManager._internal();
  factory CacheManager() => _instance;
  CacheManager._internal();

  static final Map<String, dynamic> _memoryCache = {};

  static List<dynamic> _parseJsonList(String raw) {
    return json.decode(raw) as List<dynamic>;
  }

  static Map<String, dynamic> _parseJsonMap(String raw) {
    return json.decode(raw) as Map<String, dynamic>;
  }

  Future<List<dynamic>> loadList(String path) async {
    if (_memoryCache.containsKey(path))
      return _memoryCache[path] as List<dynamic>;

    final db = AppDatabase.instance;
    final cached = await db.getCachedJson(path);
    if (cached != null) {
      final data = await compute(_parseJsonList, cached);
      _memoryCache[path] = data;
      return data;
    }

    final raw = await rootBundle.loadString(path);
    final data = await compute(_parseJsonList, raw);
    _memoryCache[path] = data;
    await db.cacheJson(path, raw);
    return data;
  }

  Future<Map<String, dynamic>> loadMap(String path) async {
    if (_memoryCache.containsKey(path))
      return _memoryCache[path] as Map<String, dynamic>;

    final db = AppDatabase.instance;
    final cached = await db.getCachedJson(path);
    if (cached != null) {
      final data = await compute(_parseJsonMap, cached);
      _memoryCache[path] = data;
      return data;
    }

    final raw = await rootBundle.loadString(path);
    final data = await compute(_parseJsonMap, raw);
    _memoryCache[path] = data;
    await db.cacheJson(path, raw);
    return data;
  }

  Future<Map<String, dynamic>> loadListItem(String path, int index) async {
    final data = await loadList(path);
    if (data.length > index) return data[index] as Map<String, dynamic>;
    if (data.isNotEmpty) return data[0] as Map<String, dynamic>;
    return {};
  }

  Future<void> preloadPools() async {
    await Future.wait([
      loadList('lib/json/pools/hadist_pool.json'),
      loadList('lib/json/pools/story_pool.json'),
      loadMap('lib/json/config/section_titles.json'),
      loadMap('lib/json/config/feed_config.json'),
    ]);
  }

  void invalidate(String path) {
    _memoryCache.remove(path);
    AppDatabase.instance.clearCache();
  }

  void invalidateAll() {
    _memoryCache.clear();
    AppDatabase.instance.clearCache();
  }
}
