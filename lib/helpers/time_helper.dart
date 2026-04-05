class TimeOfDayHelper {
  TimeOfDayHelper._();

  static String get backgroundAsset {
    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 11) return 'assets/images/gradient_morning.webp';
    if (hour >= 11 && hour < 15) return 'assets/images/gradient_afternoon.webp';
    if (hour >= 15 && hour < 18) return 'assets/images/gradient_evening.webp';
    return 'assets/images/gradient_night.webp';
  }

  static String get greeting {
    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 11) return 'Good Morning';
    if (hour >= 11 && hour < 15) return 'Good Afternoon';
    if (hour >= 15 && hour < 18) return 'Good Evening';
    return 'Good Night';
  }
}
