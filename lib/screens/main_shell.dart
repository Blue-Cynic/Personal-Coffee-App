import 'package:flutter/material.dart';
import '../widgets/app_nav_bar.dart';
import '../utils/brew_session.dart';
import 'home_screen.dart';
import 'ratio_calculator_screen.dart';
import 'grind_settings_screen.dart';
import 'stopwatch_screen.dart';
import 'notes_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  String _route = 'home';

  bool _inSequence = false;

  bool _openNotesDialog = false;

  void _selectRoute(String route) {
    setState(() {
      _route = route;
      _openNotesDialog = false;
      if (route == 'home') {
        _inSequence = false;
      }
    });
  }

  void _openTool(String route) {
    setState(() {
      _route = route;
      _openNotesDialog = false;
      _inSequence = false;
    });
  }

  void _startBrewing() {
    BrewSession.clear();
    setState(() {
      _route = 'calculator';
      _openNotesDialog = false;
      _inSequence = true;
    });
  }

  void _finishSequence() {
    setState(() {
      _route = 'notes';
      _openNotesDialog = true;
      _inSequence = false;
    });
  }

  Widget _buildScreen() {
    if (_route == 'calculator') {
      return RatioCalculatorScreen(
        inSequence: _inSequence,
        onNext: () => _selectRoute('grind'),
      );
    } else if (_route == 'grind') {
      return GrindSettingsScreen(
        inSequence: _inSequence,
        onNext: () => _selectRoute('timer'),
      );
    } else if (_route == 'timer') {
      return StopwatchScreen(
        inSequence: _inSequence,
        onNext: _finishSequence,
      );
    } else if (_route == 'notes') {
      return NotesScreen(openAddDialog: _openNotesDialog);
    } else {
      return HomeScreen(
        onStartBrewing: _startBrewing,
        onOpenTool: _openTool,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScreen(),
      bottomNavigationBar: AppNavBar(
        activeRoute: _route,
        onSelect: _selectRoute,
      ),
    );
  }
}