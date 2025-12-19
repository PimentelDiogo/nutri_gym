import '../../domain/entities/refeicao.dart';
import 'alimento_model.dart';

/// Model de refeição com serialização JSON
class RefeicaoModel extends Refeicao {
  const RefeicaoModel({
    required super.id,
    required super.nome,
    required super.horario,
    required super.alimentos,
    super.realizado,
  });

  /// Cria um RefeicaoModel a partir de JSON
  factory RefeicaoModel.fromJson(Map<String, dynamic> json) {
    return RefeicaoModel(
      id: json['id'] as String,
      nome: json['nome'] as String,
      horario: json['horario'] as String,
      alimentos: (json['alimentos'] as List)
          .map((e) => AlimentoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      realizado: json['realizado'] as bool? ?? false,
    );
  }

  /// Converte para JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'horario': horario,
      'alimentos': alimentos
          .map(
            (a) => AlimentoModel(
              nome: a.nome,
              calorias: a.calorias,
              proteina: a.proteina,
              carboidrato: a.carboidrato,
              gordura: a.gordura,
              quantidade: a.quantidade,
            ).toJson(),
          )
          .toList(),
      'realizado': realizado,
    };
  }

  /// Converte para entidade de domínio
  Refeicao toEntity() {
    return Refeicao(
      id: id,
      nome: nome,
      horario: horario,
      alimentos: alimentos,
      realizado: realizado,
    );
  }
}
