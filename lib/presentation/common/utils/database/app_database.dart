import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

class JsonCache extends Table {
  TextColumn get filePath => text()();
  TextColumn get data => text()();
  IntColumn get cachedAt => integer()();

  @override
  Set<Column> get primaryKey => {filePath};
}

class LikedItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get targetType => text()();
  TextColumn get targetFile => text()();
  IntColumn get targetIndex => integer()();
  IntColumn get likedAt => integer()();
}

@DriftDatabase(tables: [JsonCache, LikedItems])
class AppDatabase extends _$AppDatabase {
  AppDatabase._() : super(_openConnection());

  static final AppDatabase instance = AppDatabase._();

  @override
  int get schemaVersion => 1;

  Future<String?> getCachedJson(String path) async {
    final result = await (select(jsonCache)
          ..where((t) => t.filePath.equals(path)))
        .getSingleOrNull();
    return result?.data;
  }

  Future<void> cacheJson(String path, String rawData) async {
    await into(jsonCache).insertOnConflictUpdate(
      JsonCacheCompanion.insert(
        filePath: path,
        data: rawData,
        cachedAt: DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }

  Future<void> clearCache() async {
    await delete(jsonCache).go();
  }

  Future<void> addLike(String type, String file, int index) async {
    final existing = await (select(likedItems)
          ..where((t) =>
              t.targetType.equals(type) &
              t.targetFile.equals(file) &
              t.targetIndex.equals(index)))
        .getSingleOrNull();

    if (existing != null) return;

    final count = await (select(likedItems)).get();
    if (count.length >= 50) {
      final oldest = await (select(likedItems)
            ..orderBy([(t) => OrderingTerm.asc(t.likedAt)])
            ..limit(1))
          .getSingleOrNull();
      if (oldest != null) {
        await (delete(likedItems)..where((t) => t.id.equals(oldest.id))).go();
      }
    }

    await into(likedItems).insert(
      LikedItemsCompanion.insert(
        targetType: type,
        targetFile: file,
        targetIndex: index,
        likedAt: DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }

  Future<List<LikedItem>> getAllLikes() async {
    return await (select(likedItems)
          ..orderBy([(t) => OrderingTerm.desc(t.likedAt)]))
        .get();
  }

  Future<String> getDominantType() async {
    final items = await getAllLikes();
    if (items.isEmpty) return 'mixed';
    final hadistCount = items.where((i) => i.targetType == 'hadist').length;
    final bookCount = items.where((i) => i.targetType == 'book').length;
    if (hadistCount > 0 && bookCount == 0) return 'hadist';
    if (bookCount > 0 && hadistCount == 0) return 'book';
    return 'mixed';
  }

  Future<bool> hasLikes() async {
    final items = await (select(likedItems)..limit(1)).get();
    return items.isNotEmpty;
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'hadist_pedia.db'));
    return NativeDatabase.createInBackground(file);
  });
}
