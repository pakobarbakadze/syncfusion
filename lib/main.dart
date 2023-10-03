import 'package:flutter/material.dart';
import 'package:test/fl_screen.dart';
import 'package:test/sync_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isSyncFusion = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: Scaffold(appBar: AppBar(), body: const BarChartSample2()),
      home: Scaffold(
        appBar: AppBar(
          actions: [
            Switch(
              value: isSyncFusion,
              onChanged: (isSyncFUsion) {
                setState(() {
                  isSyncFusion = !isSyncFusion;
                });
              },
            )
          ],
        ),
        body: isSyncFusion ? const SyncScreen() : const FlScreen(),
      ),
    );
  }
}
