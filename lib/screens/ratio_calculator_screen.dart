import 'package:flutter/material.dart';
import '../utils/brew_calculations.dart';
import '../widgets/labeled_text_field.dart';
import '../widgets/ratio_card.dart';
import '../widgets/primary_button.dart';
import '../theme.dart';
import '../utils/brew_session.dart';
import '../widgets/dropdown_selector.dart';

class RatioCalculatorScreen extends StatefulWidget {
  final bool inSequence;
  final VoidCallback onNext;

  const RatioCalculatorScreen({
    super.key,
    required this.inSequence,
    required this.onNext,
  });

  @override
  State<RatioCalculatorScreen> createState() => _RatioCalculatorScreenState();
}

class _RatioCalculatorScreenState extends State<RatioCalculatorScreen> {
  final TextEditingController _coffeeController = TextEditingController();
  final TextEditingController _ratioController = TextEditingController(text: '15');

  String _method = 'Moka Pot';
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

    BrewSession.brewMethod = _method;
    BrewSession.coffeeGrams = coffeeGrams.round();
    BrewSession.waterGrams = (coffeeGrams * ratio).round();

    setState(() {
      _waterResult = coffeeGrams * ratio;
      _strengthLabel = calculateStrengthLabel(_method, ratio);
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose your brew method, then enter coffee and ratio to get the water amount and strength.',
            ),
            const SizedBox(height: AppSpacing.md),
            DropdownSelector(
              label: 'Brew method',
              options: const ['Moka Pot', 'French Press', 'Cold Brew'],
              selected: _method,
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  _method = value;
                });
                _calculateWater();
              },
            ),
            const SizedBox(height: AppSpacing.md),
            LabeledTextField(
              label: 'Coffee',
              unit: 'grams',
              controller: _coffeeController,
              keyboardType: TextInputType.number,
              onChanged: (value) => _calculateWater(),
            ),
            const SizedBox(height: AppSpacing.md),
            LabeledTextField(
              label: 'Ratio (1 : x)',
              controller: _ratioController,
              keyboardType: TextInputType.number,
              onChanged: (value) => _calculateWater(),
            ),
            const SizedBox(height: AppSpacing.lg),
            if (_hasResult) ...[
              RatioCard(
                waterGrams: _waterResult.round(),
                coffeeGrams: (double.tryParse(_coffeeController.text) ?? 0).round(),
                ratio: double.tryParse(_ratioController.text) ?? 0,
                strengthLabel: _strengthLabel,
              ),
              const SizedBox(height: AppSpacing.md),
              // Only the sequence gets a Next button
              if (widget.inSequence)
                PrimaryButton(
                  label: 'Next: Grind Setting',
                  icon: Icons.arrow_forward,
                  onPressed: widget.onNext,
                ),
            ] else
              const Text('Enter values above to see the water amount.'),
          ],
        ),
      ),
    );
  }
}