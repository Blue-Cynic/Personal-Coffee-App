import 'package:flutter/material.dart';

// This is a placeholder. Already here just so things will be neat and ready for me next time.
class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Brew notes are coming soon.',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}