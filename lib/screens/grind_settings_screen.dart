import 'package:flutter/material.dart';
import '../widgets/dropdown_selector.dart';
import '../widgets/grind_result_card.dart';
import '../theme.dart';

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
  Widget build(BuildContext context) {
    final clicks = _clicks;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Grind Setting'),
      ),
      body: Padding(
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
                });
              },
            ),
            const SizedBox(height: AppSpacing.lg),
            if (clicks != null)
              GrindResultCard(
                roastLevel: _roast,
                grinder: 'Timemore C3ESP',
                clickSetting: clicks,
              )
            else
              const Text('No setting found for this combination yet.'),
          ],
        ),
      ),
    );
  }
}