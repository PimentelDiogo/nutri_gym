import '../../domain/entities/alimento.dart';

/// Model de alimento com serialização JSON
class AlimentoModel extends Alimento {
  const AlimentoModel({
    required super.nome,
    required super.calorias,
    required super.proteina,
    required super.carboidrato,
    required super.gordura,
    required super.quantidade,
  });

  /// Cria um AlimentoModel a partir de JSON
  factory AlimentoModel.fromJson(Map<String, dynamic> json) {
    return AlimentoModel(
      nome: json['nome'] as String,
      calorias: (json['calorias'] as num).toDouble(),
      proteina: (json['proteina'] as num).toDouble(),
      carboidrato: (json['carboidrato'] as num).toDouble(),
      gordura: (json['gordura'] as num).toDouble(),
      quantidade: (json['quantidade'] as num).toDouble(),
    );
  }

  /// Converte para JSON
  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'calorias': calorias,
      'proteina': proteina,
      'carboidrato': carboidrato,
      'gordura': gordura,
      'quantidade': quantidade,
    };
  }

  /// Converte para entidade de domínio
  Alimento toEntity() {
    return Alimento(
      nome: nome,
      calorias: calorias,
      proteina: proteina,
      carboidrato: carboidrato,
      gordura: gordura,
      quantidade: quantidade,
    );
  }
}
