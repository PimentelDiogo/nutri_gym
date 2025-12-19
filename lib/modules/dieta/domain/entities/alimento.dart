/// Entidade de alimento
class Alimento {
  final String nome;
  final double calorias;
  final double proteina;
  final double carboidrato;
  final double gordura;
  final double quantidade; // em gramas

  const Alimento({
    required this.nome,
    required this.calorias,
    required this.proteina,
    required this.carboidrato,
    required this.gordura,
    required this.quantidade,
  });

  @override
  String toString() {
    return 'Alimento(nome: $nome, calorias: $calorias, quantidade: ${quantidade}g)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Alimento &&
        other.nome == nome &&
        other.calorias == calorias &&
        other.quantidade == quantidade;
  }

  @override
  int get hashCode => nome.hashCode ^ calorias.hashCode ^ quantidade.hashCode;
}
