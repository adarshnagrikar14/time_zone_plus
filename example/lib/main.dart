import 'package:flutter/material.dart';
import 'package:time_zone_plus/time_zone_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TimeZonePlus.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('TimeZonePlus Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Current Timezone: ${TimeZonePlus.getCurrentTimeZone()}'),
              Text('Current Country: ${TimeZonePlus.getCurrentCountryCode()}'),
            ],
          ),
        ),
      ),
    );
  }
}
