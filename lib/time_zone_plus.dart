library time_zone_plus;

import 'src/timezone_data.dart';

class TimeZonePlus {
  /// Returns timezone names (e.g. ['Asia/Kolkata', 'Asia/Colombo']) from UTC offset in minutes
  static List<String>? getTimeZonesFromOffset(int offsetMinutes) {
    return offsetToTimezones[offsetMinutes];
  }

  /// Get possible timezone names for current device
  static List<String>? getCurrentTimeZones() {
    final now = DateTime.now();
    final offset = now.timeZoneOffset.inMinutes;
    return getTimeZonesFromOffset(offset);
  }

  /// Get first matching timezone name for current device
  static String? getCurrentTimeZone() {
    return getCurrentTimeZones()?.firstOrNull;
  }

  /// Get nth timezone from current device's timezone list (0-based index)
  static String? getCurrentTimeZoneAt(int index) {
    final timezones = getCurrentTimeZones();
    if (timezones == null || index < 0 || index >= timezones.length) {
      return null;
    }
    return timezones[index];
  }

  /// Get country code from timezone name
  static String? getCountryCode(String timeZoneName) {
    return timezoneToCountry[timeZoneName];
  }

  /// Get country code for current timezone (uses first matching timezone)
  static String? getCurrentCountryCode() {
    final timezone = getCurrentTimeZone();
    if (timezone == null) return null;
    return getCountryCode(timezone);
  }

  /// Get country code for nth timezone
  static String? getCurrentCountryCodeAt(int index) {
    final timezone = getCurrentTimeZoneAt(index);
    if (timezone == null) return null;
    return getCountryCode(timezone);
  }
}
