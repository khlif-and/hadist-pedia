import 'dart:math';
import 'package:hadist_pedia/data/cache_manager.dart';
import 'package:hadist_pedia/data/app_database.dart';
import 'package:hadist_pedia/env/app_env.dart';

class FeedSection {
  final String title;
  final List<dynamic> items;
  FeedSection({required this.title, required this.items});
}

class FeedEngine {
  static final FeedEngine _instance = FeedEngine._internal();
  factory FeedEngine() => _instance;
  FeedEngine._internal();

  static List<FeedSection>? _cachedSections;
  static int? _cachedSlot;

  Future<List<FeedSection>> generateSections() async {
    final slot = AppEnv.getCurrentRotationSlot();
    if (_cachedSections != null && _cachedSlot == slot) {
      return _cachedSections!;
    }

    final cache = CacheManager();
    final hadistPool = await cache.loadList(AppEnv.hadistPoolPath);
    final storyPool = await cache.loadList(AppEnv.storyPoolPath);
    final titlesMap = await cache.loadMap(AppEnv.sectionTitlesPath);

    final timeSlot = AppEnv.getCurrentTimeSlot();
    final titles = (titlesMap[timeSlot] as List<dynamic>?)
            ?.map((e) => e.toString())
            .toList() ??
        [];

    final random = Random(slot);
    final shuffledHadist = List<dynamic>.from(hadistPool)..shuffle(random);
    final shuffledStory = List<dynamic>.from(storyPool)..shuffle(Random(slot + 1));
    final mixedPool = List<dynamic>.from([...shuffledHadist, ...shuffledStory])
      ..shuffle(Random(slot + 2));

    List<FeedSection> sections = [];
    int titleIndex = random.nextInt(titles.length.clamp(1, 20));
    int hadistOffset = 0;
    int mixedOffset = 0;

    String pickTitle() {
      if (titles.isEmpty) return 'Pilihan Untukmu';
      final t = titles[titleIndex % titles.length];
      titleIndex++;
      return t;
    }

    List<dynamic> slicePool(List<dynamic> pool, int start, int count) {
      if (pool.isEmpty) return [];
      final end = (start + count).clamp(0, pool.length);
      if (start >= pool.length) return pool.sublist(0, count.clamp(0, pool.length));
      return pool.sublist(start, end);
    }

    sections.add(FeedSection(
      title: pickTitle(),
      items: slicePool(shuffledHadist, 0, AppEnv.maxCardsPerSection),
    ));
    hadistOffset += AppEnv.maxCardsPerSection;

    sections.add(FeedSection(
      title: pickTitle(),
      items: slicePool(mixedPool, 0, 5),
    ));
    mixedOffset += 5;

    sections.add(FeedSection(
      title: pickTitle(),
      items: slicePool(shuffledHadist, hadistOffset, 5),
    ));
    hadistOffset += 5;

    final db = AppDatabase.instance;
    final hasLikes = await db.hasLikes();
    if (hasLikes) {
      final likedSection = await _buildLikedSection(hadistPool, storyPool);
      if (likedSection != null) sections.add(likedSection);
    }

    sections.add(FeedSection(
      title: pickTitle(),
      items: slicePool(mixedPool, mixedOffset, 5),
    ));

    _cachedSections = sections;
    _cachedSlot = slot;
    return sections;
  }

  Future<FeedSection?> _buildLikedSection(
    List<dynamic> hadistPool,
    List<dynamic> storyPool,
  ) async {
    final db = AppDatabase.instance;
    final dominantType = await db.getDominantType();
    List<dynamic> pool;

    if (dominantType == 'hadist') {
      pool = hadistPool;
    } else if (dominantType == 'book') {
      pool = storyPool;
    } else {
      pool = [...hadistPool, ...storyPool];
    }

    if (pool.isEmpty) return null;

    final shuffled = List<dynamic>.from(pool)
      ..shuffle(Random(AppEnv.getCurrentRotationSlot() + 99));
    return FeedSection(
      title: 'Disukai Kamu 💖',
      items: shuffled.take(AppEnv.maxCardsPerSection).toList(),
    );
  }

  Future<FeedSection> getTrendingSection() async {
    final cache = CacheManager();
    final storyPool = await cache.loadList(AppEnv.storyPoolPath);
    final titlesMap = await cache.loadMap(AppEnv.sectionTitlesPath);

    final timeSlot = AppEnv.getCurrentTimeSlot();
    final titles = (titlesMap[timeSlot] as List<dynamic>?)
            ?.map((e) => e.toString())
            .toList() ??
        [];

    final slot = AppEnv.getCurrentRotationSlot();
    final random = Random(slot + 50);
    final shuffled = List<dynamic>.from(storyPool)..shuffle(random);
    final titleIdx = random.nextInt(titles.length.clamp(1, 20));

    return FeedSection(
      title: titles.isNotEmpty ? titles[titleIdx % titles.length] : 'Kisah Pilihan',
      items: shuffled.take(AppEnv.maxCardsPerSection).toList(),
    );
  }
}
