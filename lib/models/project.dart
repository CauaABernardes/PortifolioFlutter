class Project {
  final String titulo;
  final String descricao;
  int curtidas;
  bool curtido;

  Project({
    required this.titulo,
    required this.descricao,
    this.curtidas = 0,
    this.curtido = false,
  });
}
