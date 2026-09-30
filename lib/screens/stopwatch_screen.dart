import 'dart:async';
import 'package:flutter/material.dart';
import '../widgets/primary_button.dart';
import '../widgets/timer_display.dart';
import '../utils/brew_session.dart';
import '../theme.dart';

class StopwatchScreen extends StatefulWidget {
  final bool inSequence;
  final VoidCallback onNext;

  const StopwatchScreen({
    super.key,
    required this.inSequence,
    required this.onNext,
  });

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

    BrewSession.brewTimeSeconds = _seconds;

    setState(() {
      _isRunning = false;
    });
  }

  void _reset() {
    _timer?.cancel();

    BrewSession.brewTimeSeconds = null;

    setState(() {
      _seconds = 0;
      _isRunning = false;
    });
  }

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
    final canGoNext = widget.inSequence && !_isRunning && _seconds > 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Brew Stopwatch'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TimerDisplay(
              currentTime: _formatTime(_seconds),
              isRunning: _isRunning,
              onStart: _start,
              onStop: _stop,
              onReset: _reset,
            ),
            const SizedBox(height: AppSpacing.lg),
            if (canGoNext)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                child: PrimaryButton(
                  label: 'Next: Notes',
                  icon: Icons.arrow_forward,
                  onPressed: widget.onNext,
                ),
              ),
          ],
        ),
      ),
    );
  }
}