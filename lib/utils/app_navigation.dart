import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/ratio_calculator_screen.dart';
import '../screens/stopwatch_screen.dart';
import '../screens/notes_screen.dart';

void navigateToRoute(BuildContext context, String route) {
  Widget screen;

  switch (route) {
    case 'home':
      screen = const HomeScreen();
      break;
    case 'calculator':
      screen = const RatioCalculatorScreen();
      break;
    case 'timer':
      screen = const StopwatchScreen();
      break;
    case 'notes':
      screen = const NotesScreen();
      break;
    default:
      screen = const HomeScreen();
  }

  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
}