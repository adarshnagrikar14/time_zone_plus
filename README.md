# time_zone_plus

A Flutter package to get timezone names and country codes from UTC offsets. Supports multiple timezones per offset.

## Features

* Get timezone names from UTC offset
* Get current device timezone(s)
* Get country code from timezone name
* Get timezone at specific index
* Get country code for specific timezone index

## Getting started

```yaml
dependencies:
  time_zone_plus: ^0.0.4
```

## Usage

```dart
// Get current timezone
String? timezone = TimeZonePlus.getCurrentTimeZone();
print(timezone); // e.g. 'Asia/Kolkata'

// Get all possible timezones for current offset
List<String>? timezones = TimeZonePlus.getCurrentTimeZones();
print(timezones); // e.g. ['Asia/Kolkata', 'Asia/Colombo']

// Get timezone at specific index
String? secondTz = TimeZonePlus.getCurrentTimeZoneAt(1);
print(secondTz); // e.g. 'Asia/Colombo'

// Get country code
String? countryCode = TimeZonePlus.getCountryCode('Asia/Kolkata');
print(countryCode); // 'IN'

// Get country code for current timezone
String? currentCountry = TimeZonePlus.getCurrentCountryCode();
print(currentCountry); // e.g. 'IN'

// Get country code for specific timezone index
String? secondCountry = TimeZonePlus.getCurrentCountryCodeAt(1);
print(secondCountry); // e.g. 'LK'
```