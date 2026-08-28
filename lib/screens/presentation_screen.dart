import 'package:flutter/material.dart';
import '../widgets/tech_chip.dart';

/// TELA 1 — Apresentação
/// Foto/ícone, informações pessoais, tecnologias e curiosidades.
class PresentationScreen extends StatelessWidget {
  const PresentationScreen({super.key});

  // ---------------------------------------------------------------------
  // 🔧 EDITE AQUI: suas informações pessoais
  // ---------------------------------------------------------------------
  static const String nome = 'Cauã Araujo Bernardes';
  static const String cargo = 'Aprendiz em Soluções Digitais';
  static const String bio =
      'Tenho 19 anos, gosto de jogos e principalmente daqueles '
      'com reflexões sobre a vida.';

  static const List<Map<String, dynamic>> tecnologias = [
    {'label': 'Python', 'icon': Icons.code},
    {'label': 'C++', 'icon': Icons.memory},
    {'label': 'Java', 'icon': Icons.coffee},
    {'label': 'MySQL', 'icon': Icons.storage},
    {'label': 'C#', 'icon': Icons.developer_mode},
  ];

  static const List<String> curiosidades = [
    'Tenho 2 cachorros e 2 periquitos',
    'Tenho 2 irmãos mais novos',
    'Namoro uma mulher incrível chamada Paloma S2',
  ];
  // ---------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: scheme.primaryContainer,
                backgroundImage: const AssetImage('assets/images/foto.jpg'),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                nome,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(
                cargo,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: scheme.primary),
              ),
            ),
            const SizedBox(height: 16),
            Text(bio, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 28),

            _SectionTitle(title: 'Tecnologias que eu sei'),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: tecnologias
                  .map((t) => TechChip(label: t['label'], icon: t['icon']))
                  .toList(),
            ),
            const SizedBox(height: 28),

            _SectionTitle(title: 'Curiosidades'),
            const SizedBox(height: 12),
            ...curiosidades.map(
              (c) => Card(
                margin: const EdgeInsets.only(bottom: 10),
                child: ListTile(
                  leading: Icon(Icons.star, color: scheme.secondary),
                  title: Text(c),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .titleLarge
          ?.copyWith(fontWeight: FontWeight.bold),
    );
  }
}
