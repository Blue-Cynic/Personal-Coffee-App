import 'package:flutter/material.dart';
import '../widgets/primary_button.dart';
import '../theme.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onStartBrewing;
  final ValueChanged<String> onOpenTool;

  const HomeScreen({
    super.key,
    required this.onStartBrewing,
    required this.onOpenTool,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffee Brewing Companion'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              AppSpacing.md,
              AppSpacing.md,
              AppSpacing.sm,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: PrimaryButton(
                    label: 'Start Brewing',
                    icon: Icons.coffee,
                    onPressed: onStartBrewing,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'Go step by step, or open any tool below on its own.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                // wide screen for web browser and tablet will get 2 columns
                // narrow screen for phones will get 1
                int columns = 1;
                if (constraints.maxWidth > 600) {
                  columns = 2;
                }

                return GridView.count(
                  padding: const EdgeInsets.all(16),
                  crossAxisCount: columns,
                  childAspectRatio: 2.5,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  children: [
                    _FeatureCard(
                      title: 'Ratio Calculator',
                      subtitle: 'Work out your coffee to water ratio',
                      icon: Icons.scale,
                      onTap: () => onOpenTool('calculator'),
                    ),
                    _FeatureCard(
                      title: 'Brew Stopwatch',
                      subtitle: 'Time your brew from start to finish',
                      icon: Icons.timer,
                      onTap: () => onOpenTool('timer'),
                    ),
                    _FeatureCard(
                      title: 'Grind Setting',
                      subtitle: 'Get a grind suggestion for the Timemore C3ESP',
                      icon: Icons.settings,
                      onTap: () => onOpenTool('grind'),
                    ),
                    _FeatureCard(
                      title: 'Notes',
                      subtitle: 'Log notes about a brew',
                      icon: Icons.note_alt,
                      onTap: () => onOpenTool('notes'),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Card widget that is shared for each feature button on the home screen
class _FeatureCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const _FeatureCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(icon, size: 36, color: Theme.of(context).colorScheme.primary),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 4),
                    Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}