import 'package:flutter/material.dart';
import 'primary_button.dart';
import 'outline_button.dart';

class TimerDisplay extends StatelessWidget {
  final String currentTime;
  final bool isRunning;
  final VoidCallback onStart;
  final VoidCallback onStop;
  final VoidCallback onReset;

  const TimerDisplay({
    super.key,
    required this.currentTime,
    required this.isRunning,
    required this.onStart,
    required this.onStop,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(currentTime, style: Theme.of(context).textTheme.displayLarge),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryButton(label: 'Start', onPressed: isRunning ? null : onStart),
            const SizedBox(width: 12),
            PrimaryButton(label: 'Stop', onPressed: isRunning ? onStop : null),
            const SizedBox(width: 12),
            OutlineButton(label: 'Reset', onPressed: onReset),
          ],
        ),
      ],
    );
  }
}