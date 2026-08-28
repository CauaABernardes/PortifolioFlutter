import 'package:flutter/material.dart';

/// Chip usado na tela de apresentação para mostrar uma tecnologia.
class TechChip extends StatelessWidget {
  final String label;
  final IconData icon;

  const TechChip({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Chip(
      avatar: Icon(icon, size: 18, color: scheme.onPrimaryContainer),
      label: Text(label),
      backgroundColor: scheme.primaryContainer,
      labelStyle: TextStyle(color: scheme.onPrimaryContainer),
      side: BorderSide.none,
    );
  }
}
