import '../models/dashboard_summary_model.dart';

/// DataSource local de home (simulação de API)
class HomeLocalDataSource {
  /// Simula busca de resumo do dashboard na API
  Future<DashboardSummaryModel> getSummary() async {
    // Simula delay de rede
    await Future.delayed(const Duration(seconds: 1));

    // Dados mock do dashboard
    final mockJson = {
      'pesoAtual': 75.0,
      'pesoMeta': 70.0,
      'caloriasConsumidas': 1850,
      'caloriasMeta': 2500,
      'proximoTreinoTitulo': 'Superiores - Foco Ombro',
      'proximoTreinoTipo': 'FORCA',
    };

    return DashboardSummaryModel.fromJson(mockJson);
  }
}
