import '../../domain/entities/exercicio.dart';
import '../../domain/entities/treino.dart';
import 'exercicio_model.dart';

/// Model de treino com serialização JSON
class TreinoModel extends Treino {
  const TreinoModel({
    required super.data,
    required super.titulo,
    required super.tipo,
    required super.exercicios,
  });

  /// Cria um TreinoModel a partir de JSON
  factory TreinoModel.fromJson(Map<String, dynamic> json) {
    return TreinoModel(
      data: DateTime.parse(json['data'] as String),
      titulo: json['titulo'] as String,
      tipo: _tipoFromString(json['tipo'] as String),
      exercicios: (json['exercicios'] as List)
          .map((e) => ExercicioModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// Converte para JSON
  Map<String, dynamic> toJson() {
    return {
      'data': data.toIso8601String(),
      'titulo': titulo,
      'tipo': _tipoToString(tipo),
      'exercicios': exercicios
          .map(
            (e) => ExercicioModel(
              nome: e.nome,
              series: e.series,
              repeticoes: e.repeticoes,
              urlVideo: e.urlVideo,
            ).toJson(),
          )
          .toList(),
    };
  }

  /// Converte para entidade de domínio
  Treino toEntity() {
    return Treino(
      data: data,
      titulo: titulo,
      tipo: tipo,
      exercicios: exercicios,
    );
  }

  /// Converte string para TipoTreino
  static TipoTreino _tipoFromString(String tipo) {
    switch (tipo.toUpperCase()) {
      case 'FORCA':
        return TipoTreino.forca;
      case 'AEROBICO':
        return TipoTreino.aerobico;
      default:
        return TipoTreino.forca;
    }
  }

  /// Converte TipoTreino para string
  static String _tipoToString(TipoTreino tipo) {
    switch (tipo) {
      case TipoTreino.forca:
        return 'FORCA';
      case TipoTreino.aerobico:
        return 'AEROBICO';
    }
  }
}
