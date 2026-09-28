import 'package:flutter/material.dart';
import 'strength_badge.dart';

class RatioCard extends StatelessWidget {
  final int waterGrams;
  final int coffeeGrams;
  final double ratio;
  final String strengthLabel;

  const RatioCard({
    super.key,
    required this.waterGrams,
    required this.coffeeGrams,
    required this.ratio,
    required this.strengthLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${waterGrams}g water / ${coffeeGrams}g coffee',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            StrengthBadge(label: strengthLabel),
          ],
        ),
      ),
    );
  }
}