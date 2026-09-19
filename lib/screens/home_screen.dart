import 'package:flutter/material.dart';
import 'ratio_calculator_screen.dart';
import 'stopwatch_screen.dart';
import 'grind_settings_screen.dart';
import 'notes_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffee Brewing Companion'),
      ),
      body: LayoutBuilder(
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RatioCalculatorScreen()),
                  );
                },
              ),
              _FeatureCard(
                title: 'Brew Stopwatch',
                subtitle: 'Time your brew from start to finish',
                icon: Icons.timer,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const StopwatchScreen()),
                  );
                },
              ),
              _FeatureCard(
                title: 'Grind Setting',
                subtitle: 'Get a grind suggestion for the Timemore C3ESP',
                icon: Icons.settings,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GrindSettingsScreen()),
                  );
                },
              ),
              _FeatureCard(
                title: 'Notes',
                subtitle: 'Log notes about a brew',
                icon: Icons.note_alt,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NotesScreen()),
                  );
                },
              ),
            ],
          );
        },
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