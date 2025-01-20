# time_zone_plus

A Flutter package to get timezone names from UTC offsets and country codes.

## Features

* Get timezone name from UTC offset
* Get current device timezone
* Get country code from timezone name

## Getting started

Add this to your `pubspec.yaml`:
```yaml
dependencies:
  time_zone_plus: ^0.0.1
```

## Usage

```dart
// Initialize timezone database
await TimeZonePlus.initialize();

// Get current timezone
String? timezone = TimeZonePlus.getCurrentTimeZone();
print(timezone); // e.g. 'Asia/Kolkata'

// Get timezone from offset (in minutes)
String? tz = TimeZonePlus.getTimeZoneFromOffset(330); // UTC+5:30
print(tz); // 'Asia/Kolkata'

// Get country code
String? countryCode = TimeZonePlus.getCountryCode('Asia/Kolkata');
print(countryCode); // 'IN'

// Get current country code
String? currentCountry = TimeZonePlus.getCurrentCountryCode();
print(currentCountry); // e.g. 'IN'
```