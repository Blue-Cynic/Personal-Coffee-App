import 'package:flutter/material.dart';

class StrengthBadge extends StatelessWidget {
  final String label;

  const StrengthBadge({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(label: Text(label));
  }
}