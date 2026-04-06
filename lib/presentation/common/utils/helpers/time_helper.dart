class TimeHelper {
  static String getBackgroundImage() {
    final int hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return 'assets/images/gradient_morning.webp';
    } else if (hour >= 12 && hour < 15) {
      return 'assets/images/gradient_afternoon.webp';
    } else if (hour >= 15 && hour < 18) {
      return 'assets/images/gradient_evening.webp';
    } else {
      return 'assets/images/gradient_night.webp';
    }
  }
}