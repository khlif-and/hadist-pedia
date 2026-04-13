import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hadist_pedia/env/app_env.dart';

class PreferenceHelper {
  static final PreferenceHelper _instance = PreferenceHelper._internal();
  factory PreferenceHelper() => _instance;
  PreferenceHelper._internal();

  static SharedPreferences? _prefs;
  static const String _likedKey = 'liked_items';

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> addLike(String targetType, String targetFile, int targetIndex) async {
    final prefs = _prefs ?? await SharedPreferences.getInstance();
    final liked = prefs.getStringList(_likedKey) ?? [];
    final entry = '$targetType|$targetFile|$targetIndex';

    if (!liked.contains(entry)) {
      liked.add(entry);
      if (liked.length > AppEnv.maxLikedItems) {
        liked.removeAt(0);
      }
      await prefs.setStringList(_likedKey, liked);
    }
  }

  List<Map<String, dynamic>> getLikedItems() {
    final liked = _prefs?.getStringList(_likedKey) ?? [];
    return liked.map((entry) {
      final parts = entry.split('|');
      return {
        'target_type': parts[0],
        'target_file': parts.length > 1 ? parts[1] : '',
        'target_index': parts.length > 2 ? int.tryParse(parts[2]) ?? 0 : 0,
      };
    }).toList();
  }

  String getDominantType() {
    final items = getLikedItems();
    if (items.isEmpty) return 'mixed';
    final hadistCount = items.where((i) => i['target_type'] == 'hadist').length;
    final bookCount = items.where((i) => i['target_type'] == 'book').length;
    if (hadistCount > 0 && bookCount == 0) return 'hadist';
    if (bookCount > 0 && hadistCount == 0) return 'book';
    return 'mixed';
  }

  bool hasLikes() {
    return (_prefs?.getStringList(_likedKey) ?? []).isNotEmpty;
  }
}
