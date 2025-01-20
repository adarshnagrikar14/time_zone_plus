library time_zone_plus;

import 'src/timezone_data.dart';
import 'dart:io' show Platform;

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

  /// Get the most likely timezone for the current device based on locale and offset
  static String? getCurrentTimeZone() {
    final now = DateTime.now();
    final offset = now.timeZoneOffset.inMinutes;
    final timezones = getTimeZonesFromOffset(offset);
    if (timezones == null || timezones.isEmpty) return null;
    
    if (timezones.length == 1) {
      return timezones[0];
    }

    // Try to match based on the system locale
    final locale = Platform.localeName.split('_').lastOrNull;
    if (locale != null && locale.length == 2) {
      // Find the first timezone that matches the country code from locale
      for (final timezone in timezones) {
        final countryCode = getCountryCode(timezone);
        if (countryCode?.toUpperCase() == locale.toUpperCase()) {
          return timezone;
        }
      }
    }

    // Fallback to first timezone in the list if no match found
    return timezones[0];
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
