import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'screens/main_shell.dart';
import 'theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('notes');
  
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

      theme: appTheme,

      home: const MainShell(),
    );
  }
}