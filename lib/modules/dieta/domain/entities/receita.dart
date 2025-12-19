/// Entidade de receita
class Receita {
  final String id;
  final String titulo;
  final String urlImagem;
  final int tempoPreparo; // em minutos
  final List<String> tags;
  final double calorias;

  const Receita({
    required this.id,
    required this.titulo,
    required this.urlImagem,
    required this.tempoPreparo,
    required this.tags,
    required this.calorias,
  });

  @override
  String toString() {
    return 'Receita(titulo: $titulo, calorias: $calorias, tempo: ${tempoPreparo}min)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Receita && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
