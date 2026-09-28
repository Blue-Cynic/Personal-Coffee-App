import 'package:flutter/material.dart';
import '../utils/brew_calculations.dart';
import 'notes_screen.dart';
import '../widgets/app_nav_bar.dart';
import '../utils/app_navigation.dart';
import '../widgets/labeled_text_field.dart';
import '../widgets/ratio_card.dart';
import '../widgets/primary_button.dart';
import '../theme.dart';
import '../utils/brew_session.dart';

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

    BrewSession.coffeeGrams = coffeeGrams.round();
    BrewSession.waterGrams = (coffeeGrams * ratio).round();

    setState(() {
      _waterResult = coffeeGrams * ratio;
      _strengthLabel = calculateStrengthLabel(ratio);
      _hasResult = true;
    });
  }

  void _saveToNotes() {
    if (!_hasResult) {
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NotesScreen(openAddDialog: true),
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
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter your coffee dose and ratio to get the water amount.',
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
              PrimaryButton(
                label: 'Save to Notes',
                icon: Icons.save,
                onPressed: _saveToNotes,
              ),
            ] else
              const Text('Enter values above to see the water amount.'),
          ],
        ),
      ),
    );
  }
}