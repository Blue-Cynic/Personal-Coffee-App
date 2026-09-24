import 'package:flutter/material.dart';

class BrewNote {
  final String brewMethod;
  final String text;

  BrewNote({
    required this.brewMethod,
    required this.text,
  });
}

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final List<BrewNote> _notes = [];

  void _addNote(BrewNote note) {
    setState(() {
      _notes.add(note);
    });
  }

  void _showAddNote() {
    final controller = TextEditingController();
    String method = 'Moka Pot';

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('New Brew Note'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                initialValue: method,
                decoration: const InputDecoration(
                  labelText: 'Brew method',
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'Moka Pot',
                    child: Text('Moka Pot'),
                  ),
                  DropdownMenuItem(
                    value: 'French Press',
                    child: Text('French Press'),
                  ),
                  DropdownMenuItem(
                    value: 'Cold Brew',
                    child: Text('Cold Brew'),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    method = value;
                  }
                },
              ),
              const SizedBox(height: 12),
              TextField(
                controller: controller,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Notes',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                final text = controller.text.trim();

                if (text.isEmpty) return;

                _addNote(
                  BrewNote(
                    brewMethod: method,
                    text: text,
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
      controller.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    final hasNotes = _notes.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: hasNotes
          ? ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _notes.length,
              itemBuilder: (context, idx) {
                final note = _notes[idx];

                return Card(
                  child: ListTile(
                    title: Text(note.brewMethod),
                    subtitle: Text(note.text),
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
        onPressed: _showAddNote,
        child: const Icon(Icons.add),
      ),
    );
  }
}