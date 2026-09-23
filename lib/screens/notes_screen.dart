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
      builder: (context) {
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
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                if (controller.text.trim().isEmpty) return;

                _addNote(
                  BrewNote(
                    brewMethod: method,
                    text: controller.text.trim(),
                  ),
                );

                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: _notes.isEmpty
          ? const Center(
              child: Text('No notes yet. Tap the + button to add one.'),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _notes.length,
              itemBuilder: (context, index) {
                final note = _notes[index];

                return Card(
                  child: ListTile(
                    title: Text(note.brewMethod),
                    subtitle: Text(note.text),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddNote,
        child: const Icon(Icons.add),
      ),
    );
  }
}