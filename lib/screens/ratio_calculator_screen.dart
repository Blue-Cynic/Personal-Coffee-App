import 'package:flutter/material.dart';
import '../utils/brew_calculations.dart';
import 'notes_screen.dart';
import '../widgets/app_nav_bar.dart';
import '../utils/app_navigation.dart';

class RatioCalculatorScreen extends StatefulWidget {
  const RatioCalculatorScreen({super.key});

  @override
  State<RatioCalculatorScreen> createState() => _RatioCalculatorScreenState();
}

class _RatioCalculatorScreenState extends State<RatioCalculatorScreen> {
  final TextEditingController _coffeeController = TextEditingController();
  final TextEditingController _ratioController = TextEditingController(text: '15');

  double _waterResult = 0;
  String _strengthLabel = '';
  bool _hasResult = false;

  void _calculateWater() {
    double? coffeeGrams = double.tryParse(_coffeeController.text);
    double? ratio = double.tryParse(_ratioController.text);

    if (coffeeGrams == null || ratio == null) {
      setState(() {
        _hasResult = false;
      });
      return;
    }

    setState(() {
      _waterResult = coffeeGrams * ratio;
      _strengthLabel = calculateStrengthLabel(ratio);
      _hasResult = true;
    });
  }

  void _saveToNotes() {
    final coffeeGrams = int.tryParse(_coffeeController.text);

    if (coffeeGrams == null || !_hasResult) {
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NotesScreen(
          prefillCoffeeGrams: coffeeGrams,
          prefillWaterGrams: _waterResult.round(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _coffeeController.dispose();
    _ratioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ratio Calculator'),
      ),
      bottomNavigationBar: AppNavBar(
        activeRoute: 'calculator',
        onSelect: (route) => navigateToRoute(context, route),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter your coffee dose and ratio to get the water amount.',
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _coffeeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Coffee (grams)',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                _calculateWater();
              },
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _ratioController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Ratio (1 : x)',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                _calculateWater();
              },
            ),
            const SizedBox(height: 24),
            if (_hasResult) ...[
              Card(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Use ${_waterResult.toStringAsFixed(1)}g of water',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Chip(label: Text(_strengthLabel)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: _saveToNotes,
                icon: const Icon(Icons.save),
                label: const Text('Save to Notes'),
              ),
            ] else
              const Text('Enter values above to see the water amount.'),
          ],
        ),
      ),
    );
  }
}