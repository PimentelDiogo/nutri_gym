/// Treino de um dia específico
class TreinoSemanal {
  final String diaSemana;
  final DateTime data;
  final String? titulo;
  final String? tipo;
  final bool concluido;

  const TreinoSemanal({
    required this.diaSemana,
    required this.data,
    this.titulo,
    this.tipo,
    this.concluido = false,
  });

  TreinoSemanal copyWith({
    String? diaSemana,
    DateTime? data,
    String? titulo,
    String? tipo,
    bool? concluido,
  }) {
    return TreinoSemanal(
      diaSemana: diaSemana ?? this.diaSemana,
      data: data ?? this.data,
      titulo: titulo ?? this.titulo,
      tipo: tipo ?? this.tipo,
      concluido: concluido ?? this.concluido,
    );
  }

  bool get temTreino => titulo != null;
}
