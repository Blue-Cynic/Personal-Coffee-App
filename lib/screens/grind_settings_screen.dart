import 'package:flutter/material.dart';

class GrindSettingsScreen extends StatefulWidget {
  const GrindSettingsScreen({super.key});

  @override
  State<GrindSettingsScreen> createState() => _GrindSettingsScreenState();
}

class _GrindSettingsScreenState extends State<GrindSettingsScreen> {
  static const Map<String, Map<String, int>> _settings = {
    // For now, a placeholder click values. I still need to do some research
    'Moka Pot': {
      'Medium': 16,
      'Dark': 14,
    },
    'French Press': {
      'Medium': 30,
      'Dark': 28,
    },
    'Cold Brew': {
      'Medium': 34,
      'Dark': 32,
    },
  };

  String _method = 'Moka Pot';
  String _roast = 'Medium';

  int? get _clicks => _settings[_method]?[_roast];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grind Setting'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose a brew method and roast level to get some click setting suggestions for the Timemore C3ESP.',
            ),
            const SizedBox(height: 16),

            DropdownButtonFormField<String>(
              initialValue: _method,
              decoration: const InputDecoration(
                labelText: 'Brew method',
                border: OutlineInputBorder(),
              ),
              items: _settings.keys.map((method) {
                return DropdownMenuItem(
                  value: method,
                  child: Text(method),
                );
              }).toList(),
              onChanged: (value) {
                if (value == null) return;

                setState(() {
                  _method = value;
                });
              },
            ),

            const SizedBox(height: 16),

            DropdownButtonFormField<String>(
              initialValue: _roast,
              decoration: const InputDecoration(
                labelText: 'Roast level',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: 'Light', child: Text('Light')),
                DropdownMenuItem(value: 'Medium', child: Text('Medium')),
                DropdownMenuItem(value: 'Dark', child: Text('Dark')),
              ],
              onChanged: (value) {
                if (value == null) return;

                setState(() {
                  _roast = value;
                });
              },
            ),

            const SizedBox(height: 24),

            if (_clicks != null)
              Card(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Suggested setting: $_clicks clicks',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              )
              else
                const Text('No setting for this combo just yet'),
          ],
        ),
      ),
    );
  }
}