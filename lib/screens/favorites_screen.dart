import 'package:flutter/material.dart';
import '../models/favorite_item.dart';

/// TELA EXTRA — Favoritos
/// Séries, filmes e jogos favoritos.
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  // ---------------------------------------------------------------------
  // 🔧 EDITE AQUI: seus favoritos
  // ---------------------------------------------------------------------
  static const List<FavoriteItem> favoritos = [
    FavoriteItem(
        nome: 'Homem-Aranha: Um Novo Dia',
        categoria: FavoriteCategory.filme,
        emoji: '🎬',
        nota: 5,
        imagem: 'assets/images/favoritos/homem_aranha.jpg'),
    FavoriteItem(
        nome: 'Oppenheimer',
        categoria: FavoriteCategory.filme,
        emoji: '🎬',
        nota: 5,
        imagem: 'assets/images/favoritos/oppenheimer.jpg'),
    FavoriteItem(
        nome: '1917',
        categoria: FavoriteCategory.filme,
        emoji: '🎬',
        nota: 5,
        imagem: 'assets/images/favoritos/1917.jpg'),
    FavoriteItem(
        nome: 'Loki',
        categoria: FavoriteCategory.serie,
        emoji: '📺',
        nota: 5,
        imagem: 'assets/images/favoritos/loki.jpg'),
    FavoriteItem(
        nome: 'Brooklyn 99',
        categoria: FavoriteCategory.serie,
        emoji: '📺',
        nota: 5,
        imagem: 'assets/images/favoritos/brooklyn99.jpg'),
    FavoriteItem(
        nome: 'Bleach',
        categoria: FavoriteCategory.serie,
        emoji: '📺',
        nota: 5,
        imagem: 'assets/images/favoritos/bleach.jpg'),
    FavoriteItem(
        nome: 'Cyberpunk 2077',
        categoria: FavoriteCategory.jogo,
        emoji: '🎮',
        nota: 5,
        imagem: 'assets/images/favoritos/cyberpunk2077.jpg'),
    FavoriteItem(
        nome: 'God of War: Ragnarök',
        categoria: FavoriteCategory.jogo,
        emoji: '🎮',
        nota: 5,
        imagem: 'assets/images/favoritos/gow_ragnarok.jpg'),
  ];
  // ---------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favoritos')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.95,
        ),
        itemCount: favoritos.length,
        itemBuilder: (context, index) {
          final item = favoritos[index];
          return Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: item.imagem != null
                      ? Image.asset(
                          item.imagem!,
                          fit: BoxFit.cover,
                          // Se o arquivo de imagem não existir, mostra o emoji
                          errorBuilder: (context, error, stackTrace) => Center(
                            child: Text(item.emoji,
                                style: const TextStyle(fontSize: 40)),
                          ),
                        )
                      : Center(
                          child: Text(item.emoji,
                              style: const TextStyle(fontSize: 40)),
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 6),
                  child: Column(
                    children: [
                      Text(
                        item.nome,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        item.categoriaLabel,
                        style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (i) {
                          if (item.nota >= i + 1) {
                            return const Icon(Icons.star,
                                size: 14, color: Colors.amber);
                          } else if (item.nota > i) {
                            return const Icon(Icons.star_half,
                                size: 14, color: Colors.amber);
                          }
                          return const Icon(Icons.star_border,
                              size: 14, color: Colors.amber);
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
