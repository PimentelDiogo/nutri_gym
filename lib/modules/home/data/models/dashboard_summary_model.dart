import '../../domain/entities/dashboard_summary.dart';

/// Model de resumo do dashboard com serialização JSON
class DashboardSummaryModel extends DashboardSummary {
  const DashboardSummaryModel({
    required super.pesoAtual,
    required super.pesoMeta,
    required super.caloriasConsumidas,
    required super.caloriasMeta,
    required super.proximoTreinoTitulo,
    required super.proximoTreinoTipo,
  });

  /// Cria um DashboardSummaryModel a partir de JSON
  factory DashboardSummaryModel.fromJson(Map<String, dynamic> json) {
    return DashboardSummaryModel(
      pesoAtual: (json['pesoAtual'] as num).toDouble(),
      pesoMeta: (json['pesoMeta'] as num).toDouble(),
      caloriasConsumidas: json['caloriasConsumidas'] as int,
      caloriasMeta: json['caloriasMeta'] as int,
      proximoTreinoTitulo: json['proximoTreinoTitulo'] as String,
      proximoTreinoTipo: json['proximoTreinoTipo'] as String,
    );
  }

  /// Converte para JSON
  Map<String, dynamic> toJson() {
    return {
      'pesoAtual': pesoAtual,
      'pesoMeta': pesoMeta,
      'caloriasConsumidas': caloriasConsumidas,
      'caloriasMeta': caloriasMeta,
      'proximoTreinoTitulo': proximoTreinoTitulo,
      'proximoTreinoTipo': proximoTreinoTipo,
    };
  }

  /// Converte para entidade de domínio
  DashboardSummary toEntity() {
    return DashboardSummary(
      pesoAtual: pesoAtual,
      pesoMeta: pesoMeta,
      caloriasConsumidas: caloriasConsumidas,
      caloriasMeta: caloriasMeta,
      proximoTreinoTitulo: proximoTreinoTitulo,
      proximoTreinoTipo: proximoTreinoTipo,
    );
  }
}
