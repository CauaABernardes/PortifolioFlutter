import 'dart:math';
import 'package:flutter/material.dart';
import '../models/project.dart';

/// TELA 2 — Dinâmica
/// Frases que mudam + lista de projetos com botão de curtir.
class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  // ---------------------------------------------------------------------
  // 🔧 EDITE AQUI: suas frases e seus projetos
  // ---------------------------------------------------------------------
  final List<String> frases = const [
    '"Never Fade Away"',
    '"Eu só quero que o mundo saiba que eu estive aqui, que eu importei"',
    '"Se tiver que matar... mate. Se tiver que queimar tudo até virar pó... então queime"',
    '"Você acredita que enganou a morte. É a morte que te enganou"',
    '"Até mais nas grandes ligas, Jack"',
  ];

  final List<Project> projetos = [
    Project(
      titulo: 'FastCertifier',
      descricao:
          'Gera certificados automaticamente e envia por e-mail sem nenhuma intervenção manual, do início ao fim do processo.',
      curtidas: 12,
    ),
    Project(
      titulo: 'Salus',
      descricao: 'Sistema de Agendamento Logístico Unificado em Saúde.',
      curtidas: 8,
    ),
    Project(
      titulo: 'E-Factory',
      descricao: 'Plataforma de aprendizagem técnica e interpessoal.',
      curtidas: 20,
    ),
  ];
  // ---------------------------------------------------------------------

  late String fraseAtual;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    fraseAtual = frases[_random.nextInt(frases.length)];
  }

  void _novaFrase() {
    setState(() {
      String nova;
      do {
        nova = frases[_random.nextInt(frases.length)];
      } while (nova == fraseAtual && frases.length > 1);
      fraseAtual = nova;
    });
  }

  void _toggleCurtir(Project projeto) {
    setState(() {
      projeto.curtido = !projeto.curtido;
      projeto.curtidas += projeto.curtido ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Meus Projetos')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Card da frase dinâmica
          Card(
            color: scheme.primaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Icon(Icons.format_quote, color: scheme.primary, size: 32),
                  const SizedBox(height: 8),
                  Text(
                    fraseAtual,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 12),
                  TextButton.icon(
                    onPressed: _novaFrase,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Nova frase'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Projetos',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ...projetos.map(
            (p) => Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                title: Text(p.titulo,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(p.descricao),
                trailing: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      visualDensity: VisualDensity.compact,
                      icon: Icon(
                        p.curtido ? Icons.favorite : Icons.favorite_border,
                        color: p.curtido ? Colors.red : null,
                      ),
                      onPressed: () => _toggleCurtir(p),
                    ),
                    const SizedBox(height: 4),
                    Text('${p.curtidas}',
                        style: const TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
