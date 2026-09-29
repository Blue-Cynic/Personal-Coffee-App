import 'package:flutter/material.dart';

class AppNavBar extends StatelessWidget {
  final String activeRoute;
  final ValueChanged<String> onSelect;

  const AppNavBar({
    super.key,
    required this.activeRoute,
    required this.onSelect,
  });

  static const List<String> _routes = ['home', 'calculator', 'timer', 'notes'];

  int get _selectedIndex {
    final index = _routes.indexOf(activeRoute);
    return index == -1 ? 0 : index;
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: _selectedIndex,
      onDestinationSelected: (index) {
        final route = _routes[index];

        if (route == activeRoute) {
          return;
        }

        onSelect(route);
      },
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.calculate), label: 'Calc'),
        NavigationDestination(icon: Icon(Icons.timer), label: 'Timer'),
        NavigationDestination(icon: Icon(Icons.note_alt), label: 'Notes'),
      ],
    );
  }
}