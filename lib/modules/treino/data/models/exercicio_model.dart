import '../../domain/entities/exercicio.dart';

/// Model de exercício com serialização JSON
class ExercicioModel extends Exercicio {
  const ExercicioModel({
    required super.nome,
    required super.series,
    required super.repeticoes,
    super.urlVideo,
  });

  /// Cria um ExercicioModel a partir de JSON
  factory ExercicioModel.fromJson(Map<String, dynamic> json) {
    return ExercicioModel(
      nome: json['nome'] as String,
      series: json['series'] as int,
      repeticoes: json['repeticoes'] as int,
      urlVideo: json['urlVideo'] as String?,
    );
  }

  /// Converte para JSON
  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'series': series,
      'repeticoes': repeticoes,
      'urlVideo': urlVideo,
    };
  }

  /// Converte para entidade de domínio
  Exercicio toEntity() {
    return Exercicio(
      nome: nome,
      series: series,
      repeticoes: repeticoes,
      urlVideo: urlVideo,
    );
  }
}
