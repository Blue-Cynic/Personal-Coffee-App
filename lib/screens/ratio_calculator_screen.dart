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
import '../widgets/dropdown_selector.dart';

class RatioCalculatorScreen extends StatefulWidget {
  const RatioCalculatorScreen({super.key});

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