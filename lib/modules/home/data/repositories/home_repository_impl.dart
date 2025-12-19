import '../../domain/entities/dashboard_summary.dart';
import '../../domain/repositories/i_home_repository.dart';
import '../datasources/home_datasource.dart';

/// Implementação do repositório de home
class HomeRepositoryImpl implements IHomeRepository {
  final HomeLocalDataSource dataSource;

  const HomeRepositoryImpl(this.dataSource);

  @override
  Future<DashboardSummary> getSummary() async {
    try {
      final summaryModel = await dataSource.getSummary();
      return summaryModel.toEntity();
    } catch (e) {
      // Em um caso real, aqui você converteria exceptions para failures
      rethrow;
    }
  }
}
