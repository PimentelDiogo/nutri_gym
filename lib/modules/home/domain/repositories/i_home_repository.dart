import '../entities/dashboard_summary.dart';

/// Interface do repositório de home
abstract class IHomeRepository {
  /// Busca o resumo do dashboard
  Future<DashboardSummary> getSummary();
}
