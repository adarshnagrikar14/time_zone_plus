library time_zone_plus;

import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'src/timezone_data.dart';

class TimeZonePlus {
  static Future<void> initialize() async {
    tz.initializeTimeZones();
  }

  /// Returns timezone name (e.g. 'Asia/Kolkata') from UTC offset in minutes
  static String? getTimeZoneFromOffset(int offsetMinutes) {
    final locations = tz.timeZoneDatabase.locations;

    DateTime now = DateTime.now().toUtc();

    return locations.entries
        .where((entry) {
          final location = entry.value;
          final currentPeriod = location.timeZone(now.millisecondsSinceEpoch);
          return currentPeriod.offset == offsetMinutes * 60;
        })
        .map((e) => e.key)
        .firstOrNull;
  }

  /// Get current device timezone name (e.g. 'Asia/Kolkata')
  static String? getCurrentTimeZone() {
    final now = DateTime.now();
    final offset = now.timeZoneOffset.inMinutes;
    return getTimeZoneFromOffset(offset);
  }

  /// Get country code from timezone name (e.g. 'IN' from 'Asia/Kolkata')
  static String? getCountryCode(String timeZoneName) {
    return timezoneToCountry[timeZoneName];
  }

  /// Get country code for current timezone
  static String? getCurrentCountryCode() {
    final timezone = getCurrentTimeZone();
    if (timezone == null) return null;
    return getCountryCode(timezone);
  }
}
