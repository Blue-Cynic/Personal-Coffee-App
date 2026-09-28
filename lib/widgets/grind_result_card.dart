import 'package:flutter/material.dart';

class GrindResultCard extends StatelessWidget {
  final String roastLevel;
  final String grinder;
  final String clickSetting;

  const GrindResultCard({
    super.key,
    required this.roastLevel,
    required this.grinder,
    required this.clickSetting,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          'Suggested setting: $clickSetting clicks',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}