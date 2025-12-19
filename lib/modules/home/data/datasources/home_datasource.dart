import '../../../../core/network/http_client.dart';
import '../models/dashboard_summary_model.dart';

/// DataSource de home consumindo API
class HomeLocalDataSource {
  final HttpClient httpClient;

  HomeLocalDataSource(this.httpClient);

  /// Busca resumo do dashboard na API
  Future<DashboardSummaryModel> getSummary() async {
    final response = await httpClient.get('/api/v1/dashboard/summary');

    // API retorna {statusCode: 200, data: {...}}
    final data = response['data'] as Map<String, dynamic>;
    return DashboardSummaryModel.fromJson(data);
  }
}
