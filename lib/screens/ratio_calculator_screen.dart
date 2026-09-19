import 'package:flutter/material.dart';

class RatioCalculatorScreen extends StatefulWidget {
  const RatioCalculatorScreen({super.key});

  @override
  State<RatioCalculatorScreen> createState() => _RatioCalculatorScreenState();
}

class _RatioCalculatorScreenState extends State<RatioCalculatorScreen> {
  final TextEditingController _coffeeController = TextEditingController();
  final TextEditingController _ratioController = TextEditingController(text: '15');

  double _waterResult = 0;
  bool _hasResult = false;

  // Recalculates the water needed from the amount of coffee and the ratio
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
      _hasResult = true;
    });
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
            if (_hasResult)
              Card(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Use ${_waterResult.toStringAsFixed(1)}g of water',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              )
            else
              const Text('Enter values above to see the water amount.'),
          ],
        ),
      ),
    );
  }
}