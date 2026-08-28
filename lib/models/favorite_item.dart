enum FavoriteCategory { filme, serie, jogo }

class FavoriteItem {
  final String nome;
  final FavoriteCategory categoria;
  final String emoji;
  final double nota; // de 0 a 5
  final String? imagem; // caminho do asset, ex: 'assets/images/favoritos/nome.jpg'

  const FavoriteItem({
    required this.nome,
    required this.categoria,
    required this.emoji,
    required this.nota,
    this.imagem,
  });

  String get categoriaLabel {
    switch (categoria) {
      case FavoriteCategory.filme:
        return 'Filme';
      case FavoriteCategory.serie:
        return 'Série';
      case FavoriteCategory.jogo:
        return 'Jogo';
    }
  }
}
