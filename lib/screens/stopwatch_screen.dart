import 'dart:async';
import 'package:flutter/material.dart';
import '../widgets/app_nav_bar.dart';
import '../utils/app_navigation.dart';

class StopwatchScreen extends StatefulWidget {
  const StopwatchScreen({super.key});

  @override
  State<StopwatchScreen> createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen> {
  int _seconds = 0;
  Timer? _timer;
  bool _isRunning = false;

  void _start() {
    if (_isRunning) {
      return;
    }

    setState(() {
      _isRunning = true;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds = _seconds + 1;
      });
    });
  }

  void _stop() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
    });
  }

  void _reset() {
    _timer?.cancel();
    setState(() {
      _seconds = 0;
      _isRunning = false;
    });
  }

  // Formats total seconds as m:ss
  String _formatTime(int totalSeconds) {
    int minutes = totalSeconds ~/ 60;
    int remainingSeconds = totalSeconds % 60;

    String secondsText;
    if (remainingSeconds < 10) {
      secondsText = '0$remainingSeconds';
    } else {
      secondsText = '$remainingSeconds';
    }

    return '$minutes:$secondsText';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brew Stopwatch'),
      ),
      bottomNavigationBar: AppNavBar(
        activeRoute: 'timer',
        onSelect: (route) => navigateToRoute(context, route),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _formatTime(_seconds),
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _isRunning ? null : _start,
                  child: const Text('Start'),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: _isRunning ? _stop : null,
                  child: const Text('Stop'),
                ),
                const SizedBox(width: 12),
                OutlinedButton(
                  onPressed: _reset,
                  child: const Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}