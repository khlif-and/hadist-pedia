class AppEnv {
  static const int rotateHours = 4;
  static const int maxCardsPerSection = 7;
  static const int maxDynamicSections = 5;
  static const int maxLikedItems = 50;

  static const String hadistPoolPath = 'lib/json/pools/hadist_pool.json';
  static const String storyPoolPath = 'lib/json/pools/story_pool.json';
  static const String sectionTitlesPath = 'lib/json/config/section_titles.json';
  static const String feedConfigPath = 'lib/json/config/feed_config.json';

  static const String hadistBukhariPath = 'lib/json/hadist_bukhari.json';
  static const String hadistKudsiPath = 'lib/json/hadist_kudsi.json';
  static const String storyTabiinPath = 'lib/json/story_tabiin.json';

  static const Map<String, List<int>> timeSlots = {
    'pagi': [4, 11],
    'siang': [11, 15],
    'sore': [15, 18],
    'malam_1': [18, 24],
    'malam_2': [0, 4],
  };

  static String getCurrentTimeSlot() {
    final hour = DateTime.now().hour;
    if (hour >= 4 && hour < 11) return 'pagi';
    if (hour >= 11 && hour < 15) return 'siang';
    if (hour >= 15 && hour < 18) return 'sore';
    return 'malam';
  }

  static int getCurrentRotationSlot() {
    final now = DateTime.now();
    return now.year * 100000 + now.month * 1000 + now.day * 10 + (now.hour ~/ rotateHours);
  }
}
