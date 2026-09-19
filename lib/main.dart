import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const CoffeeCompanionApp(),
    ),
  );
}

class CoffeeCompanionApp extends StatelessWidget {
  const CoffeeCompanionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Brewing Companion',
      debugShowCheckedModeBanner: false,

      // DevicePreview needs this for its toolbar. DO NOT KILL
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,

      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6F4E37)),
      ),

      home: const HomeScreen(),
    );
  }
}