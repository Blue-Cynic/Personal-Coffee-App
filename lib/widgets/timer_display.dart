import 'package:flutter/material.dart';
import '../theme.dart';
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
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(currentTime, style: Theme.of(context).textTheme.displayLarge),
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          child: Row(
            children: [
              Expanded(
                child: PrimaryButton(
                  label: 'Start',
                  onPressed: isRunning ? null : onStart,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: PrimaryButton(
                  label: 'Stop',
                  onPressed: isRunning ? onStop : null,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: OutlineButton(
                  label: 'Reset',
                  onPressed: onReset,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}