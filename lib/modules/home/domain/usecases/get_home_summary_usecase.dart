import '../entities/dashboard_summary.dart';
import '../repositories/i_home_repository.dart';

/// Use case para buscar o resumo do dashboard
class GetHomeSummaryUseCase {
  final IHomeRepository repository;

  const GetHomeSummaryUseCase(this.repository);

  /// Executa o caso de uso
  Future<DashboardSummary> call() async {
    return await repository.getSummary();
  }
}
