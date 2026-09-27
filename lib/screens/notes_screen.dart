import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import '../utils/brew_calculations.dart';

class BrewNote {
  final String brewMethod;
  final int coffeeGrams;
  final int waterGrams;
  final double ratio;
  final String strengthLabel;
  final String roastLevel;
  final int grindSetting;
  final int brewTimeSeconds;
  final String tasteNotes;
  final double tempCelsius;
  final DateTime dateCreated;

  BrewNote({
    required this.brewMethod,
    required this.coffeeGrams,
    required this.waterGrams,
    required this.ratio,
    required this.strengthLabel,
    required this.roastLevel,
    required this.grindSetting,
    required this.brewTimeSeconds,
    required this.tasteNotes,
    required this.tempCelsius,
    required this.dateCreated,
  });

  Map<String, dynamic> toMap() {
    return {
      'brewMethod': brewMethod,
      'coffeeGrams': coffeeGrams,
      'waterGrams': waterGrams,
      'ratio': ratio,
      'strengthLabel': strengthLabel,
      'roastLevel': roastLevel,
      'grindSetting': grindSetting,
      'brewTimeSeconds': brewTimeSeconds,
      'tasteNotes': tasteNotes,
      'tempCelsius': tempCelsius,
      'dateCreated': dateCreated.toIso8601String(),
    };
  }

  factory BrewNote.fromMap(Map<dynamic, dynamic> map) {
    return BrewNote(
      brewMethod: map['brewMethod'] as String,
      coffeeGrams: map['coffeeGrams'] as int,
      waterGrams: map['waterGrams'] as int,
      ratio: map['ratio'] as double,
      strengthLabel: map['strengthLabel'] as String,
      roastLevel: map['roastLevel'] as String,
      grindSetting: map['grindSetting'] as int,
      brewTimeSeconds: map['brewTimeSeconds'] as int,
      tasteNotes: map['tasteNotes'] as String,
      tempCelsius: (map['tempCelsius'] as num).toDouble(),
      dateCreated: DateTime.parse(map['dateCreated'] as String),
    );
  }
}

class NotesScreen extends StatefulWidget {
  final int? prefillCoffeeGrams;
  final int? prefillWaterGrams;
  final String? prefillBrewMethod;

  const NotesScreen({
    super.key,
    this.prefillCoffeeGrams,
    this.prefillWaterGrams,
    this.prefillBrewMethod,
  });

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final Box _notesBox = Hive.box('notes');

  @override
  void initState() {
    super.initState();

    if (widget.prefillCoffeeGrams != null && widget.prefillWaterGrams != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showAddNoteDialog(
          initialCoffeeGrams: widget.prefillCoffeeGrams,
          initialWaterGrams: widget.prefillWaterGrams,
          initialMethod: widget.prefillBrewMethod,
        );
      });
    }
  }

  List<BrewNote> get _notes {
    final notes = _notesBox.values
        .map((rawMap) => BrewNote.fromMap(rawMap as Map))
        .toList();

    notes.sort((a, b) => b.dateCreated.compareTo(a.dateCreated));

    return notes;
  }

  void _addNote(BrewNote note) {
    _notesBox.add(note.toMap());
    setState(() {});
  }

  void _showAddNoteDialog({
    int? initialCoffeeGrams,
    int? initialWaterGrams,
    String? initialMethod,
  }) {
    final coffeeController = TextEditingController(
      text: initialCoffeeGrams?.toString() ?? '',
    );
    final waterController = TextEditingController(
      text: initialWaterGrams?.toString() ?? '',
    );
    final grindController = TextEditingController();
    final brewTimeController = TextEditingController();
    final tempController = TextEditingController();
    final tasteController = TextEditingController();

    String method = initialMethod ?? 'Moka Pot';
    String roast = 'Medium';

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('New Brew Note'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<String>(
                  initialValue: method,
                  decoration: const InputDecoration(labelText: 'Brew method'),
                  items: const [
                    DropdownMenuItem(value: 'Moka Pot', child: Text('Moka Pot')),
                    DropdownMenuItem(value: 'French Press', child: Text('French Press')),
                    DropdownMenuItem(value: 'Cold Brew', child: Text('Cold Brew')),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      method = value;
                    }
                  },
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  initialValue: roast,
                  decoration: const InputDecoration(labelText: 'Roast level'),
                  items: const [
                    DropdownMenuItem(value: 'Medium', child: Text('Medium')),
                    DropdownMenuItem(value: 'Dark', child: Text('Dark')),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      roast = value;
                    }
                  },
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: coffeeController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Coffee (grams)'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: waterController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Water (grams)'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: grindController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Grind setting (clicks)'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: brewTimeController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Brew time (seconds)'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: tempController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Temp (Celsius)'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: tasteController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Taste notes',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                final coffeeGrams = int.tryParse(coffeeController.text);
                final waterGrams = int.tryParse(waterController.text);
                final grindSetting = int.tryParse(grindController.text) ?? 0;
                final brewTimeSeconds = int.tryParse(brewTimeController.text) ?? 0;
                final tempCelsius = double.tryParse(tempController.text) ?? 0;

                if (coffeeGrams == null || waterGrams == null || coffeeGrams == 0) {
                  return;
                }

                final ratio = waterGrams / coffeeGrams;

                _addNote(
                  BrewNote(
                    brewMethod: method,
                    coffeeGrams: coffeeGrams,
                    waterGrams: waterGrams,
                    ratio: ratio,
                    strengthLabel: calculateStrengthLabel(ratio),
                    roastLevel: roast,
                    grindSetting: grindSetting,
                    brewTimeSeconds: brewTimeSeconds,
                    tasteNotes: tasteController.text.trim(),
                    tempCelsius: tempCelsius,
                    dateCreated: DateTime.now(),
                  ),
                );

                Navigator.pop(dialogContext);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    ).then((_) {
      coffeeController.dispose();
      waterController.dispose();
      grindController.dispose();
      brewTimeController.dispose();
      tempController.dispose();
      tasteController.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    final notes = _notes;
    final hasNotes = notes.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: hasNotes
          ? ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: notes.length,
              itemBuilder: (context, idx) {
                final note = notes[idx];

                return Card(
                  child: ListTile(
                    title: Text(
                      '${note.brewMethod} · ${note.ratio.toStringAsFixed(1)}',
                    ),
                    subtitle: Text(
                      '${note.roastLevel} roast · ${note.grindSetting} clicks · ${note.strengthLabel}\n${note.tasteNotes}',
                    ),
                    isThreeLine: true,
                  ),
                );
              },
            )
          : const Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'No notes yet. Tap the + button to add one.',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddNoteDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }
}