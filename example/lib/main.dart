import 'package:flutter/material.dart';
import 'package:time_zone_plus/timezone_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final offset = now.timeZoneOffset.inMinutes;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('TimeZonePlus Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'Current UTC Offset: ${offset >= 0 ? '+' : ''}${offset ~/ 60}:${offset % 60}'),
              const SizedBox(height: 20),
              Text('Possible Timezones: ${TimeZonePlus.getCurrentTimeZones()}'),
              const SizedBox(height: 20),
              Text('Selected Timezone: ${TimeZonePlus.getCurrentTimeZone()}'),
              const SizedBox(height: 20),
              Text('Country Code: ${TimeZonePlus.getCurrentCountryCode()}'),
            ],
          ),
        ),
      ),
    );
  }
}
