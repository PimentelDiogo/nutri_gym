import '../../domain/entities/receita.dart';

/// Model de receita com serialização JSON
class ReceitaModel extends Receita {
  const ReceitaModel({
    required super.id,
    required super.titulo,
    required super.urlImagem,
    required super.tempoPreparo,
    required super.tags,
    required super.calorias,
  });

  /// Cria um ReceitaModel a partir de JSON
  factory ReceitaModel.fromJson(Map<String, dynamic> json) {
    return ReceitaModel(
      id: json['id'] as String,
      titulo: json['titulo'] as String,
      urlImagem: json['urlImagem'] as String,
      tempoPreparo: json['tempoPreparo'] as int,
      tags: (json['tags'] as List).map((e) => e as String).toList(),
      calorias: (json['calorias'] as num).toDouble(),
    );
  }

  /// Converte para JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'urlImagem': urlImagem,
      'tempoPreparo': tempoPreparo,
      'tags': tags,
      'calorias': calorias,
    };
  }

  /// Converte para entidade de domínio
  Receita toEntity() {
    return Receita(
      id: id,
      titulo: titulo,
      urlImagem: urlImagem,
      tempoPreparo: tempoPreparo,
      tags: tags,
      calorias: calorias,
    );
  }
}
