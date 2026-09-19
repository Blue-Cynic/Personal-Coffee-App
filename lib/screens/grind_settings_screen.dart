import 'package:flutter/material.dart';

// This is a placeholder screen. Is already here to keep things neat for my sake.
// Is a placeholder because I will need to first research the clicks to my grinder.
class GrindSettingsScreen extends StatelessWidget {
  const GrindSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grind Setting'),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Grind setting suggester for the Timemore C3ESP is coming soon.',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}