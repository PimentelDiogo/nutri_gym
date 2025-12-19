import '../../domain/entities/treino_semanal.dart';

/// Model para treino semanal
class TreinoSemanalModel extends TreinoSemanal {
  const TreinoSemanalModel({
    required super.diaSemana,
    required super.data,
    super.titulo,
    super.tipo,
    super.concluido,
  });

  factory TreinoSemanalModel.fromJson(Map<String, dynamic> json) {
    return TreinoSemanalModel(
      diaSemana: json['diaSemana'] as String,
      data: DateTime.parse(json['data'] as String),
      titulo: json['titulo'] as String?,
      tipo: json['tipo'] as String?,
      concluido: json['concluido'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'diaSemana': diaSemana,
      'data': data.toIso8601String(),
      'titulo': titulo,
      'tipo': tipo,
      'concluido': concluido,
    };
  }

  TreinoSemanal toEntity() {
    return TreinoSemanal(
      diaSemana: diaSemana,
      data: data,
      titulo: titulo,
      tipo: tipo,
      concluido: concluido,
    );
  }
}
