import 'exercicio.dart';

/// Entidade de treino
class Treino {
  final DateTime data;
  final String titulo;
  final TipoTreino tipo;
  final List<Exercicio> exercicios;

  const Treino({
    required this.data,
    required this.titulo,
    required this.tipo,
    required this.exercicios,
  });

  @override
  String toString() {
    return 'Treino(data: $data, titulo: $titulo, tipo: $tipo, exercicios: ${exercicios.length})';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Treino &&
        other.data == data &&
        other.titulo == titulo &&
        other.tipo == tipo &&
        other.exercicios.length == exercicios.length;
  }

  @override
  int get hashCode {
    return data.hashCode ^
        titulo.hashCode ^
        tipo.hashCode ^
        exercicios.hashCode;
  }
}
