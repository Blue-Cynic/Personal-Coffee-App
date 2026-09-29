import 'package:flutter/material.dart';
import '../widgets/dropdown_selector.dart';
import '../widgets/grind_result_card.dart';
import '../widgets/primary_button.dart';
import '../utils/brew_session.dart';
import '../theme.dart';
import 'notes_screen.dart';

class GrindSettingsScreen extends StatefulWidget {
  const GrindSettingsScreen({super.key});

  @override
  State<GrindSettingsScreen> createState() => _GrindSettingsScreenState();
}

class _GrindSettingsScreenState extends State<GrindSettingsScreen> {
  static const Map<String, Map<String, String>> _settings = {
    // Yeah, french press and cold brew share the same grind settings
    // This is because they both use coarse grinds and from experience, medium and dark both can use the same settings
    // Some insist cold brew needs extra coarse grinds, I find that wrong from experience and means more hours to brew it
    'Moka Pot': {
      'Medium': '30-40',
      'Dark': '32-42',
    },
    'French Press': {
      'Medium': '60-69',
      'Dark': '60-69',
    },
    'Cold Brew': {
      'Medium': '60-69',
      'Dark': '60-69',
    },
  };

  String _method = 'Moka Pot';
  String _roast = 'Medium';

  String? get _clicks => _settings[_method]?[_roast];

  @override
  void initState() {
    super.initState();
    _updateSession();
  }

  void _updateSession() {
    BrewSession.brewMethod = _method;
    BrewSession.roastLevel = _roast;
    BrewSession.grindSetting = _rangeMidpoint(_clicks);
  }

  int? _rangeMidpoint(String? range) {
    if (range == null) {
      return null;
    }

    final parts = range.split('-');

    if (parts.length != 2) {
      return int.tryParse(range);
    }

    final low = int.tryParse(parts[0]);
    final high = int.tryParse(parts[1]);

    if (low == null || high == null) {
      return null;
    }

    return (low + high) ~/ 2;
  }

  void _saveToNotes() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NotesScreen(openAddDialog: true),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final clicks = _clicks;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Grind Setting'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose a brew method and roast level to get some click setting suggestions for the Timemore C3ESP.',
            ),
            const SizedBox(height: AppSpacing.md),
            DropdownSelector(
              label: 'Brew method',
              options: _settings.keys.toList(),
              selected: _method,
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  _method = value;
                  _updateSession();
                });
              },
            ),
            const SizedBox(height: AppSpacing.md),
            DropdownSelector(
              label: 'Roast level',
              options: const ['Medium', 'Dark'],
              selected: _roast,
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  _roast = value;
                  _updateSession();
                });
              },
            ),
            const SizedBox(height: AppSpacing.lg),
            if (clicks != null) ...[
              GrindResultCard(
                roastLevel: _roast,
                grinder: 'Timemore C3ESP',
                clickSetting: clicks,
              ),
              const SizedBox(height: AppSpacing.md),
              PrimaryButton(
                label: 'Save to Notes',
                icon: Icons.save,
                onPressed: _saveToNotes,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'The note starts with the middle of the range. Adjust it after you taste the brew.',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ] else
              const Text('No setting found for this combination yet.'),
          ],
        ),
      ),
    );
  }
}