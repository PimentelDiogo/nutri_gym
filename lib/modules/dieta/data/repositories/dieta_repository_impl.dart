import '../../domain/entities/receita.dart';
import '../../domain/entities/refeicao.dart';
import '../../domain/repositories/i_dieta_repository.dart';
import '../datasources/dieta_datasource.dart';

/// Implementação do repositório de dieta
class DietaRepositoryImpl implements IDietaRepository {
  final DietaLocalDataSource dataSource;

  const DietaRepositoryImpl(this.dataSource);

  @override
  Future<List<Refeicao>> getPlanoDoDia() async {
    try {
      final refeicaoModels = await dataSource.getPlanoDoDia();
      return refeicaoModels.map((model) => model.toEntity()).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> toggleRefeicao(String id) async {
    try {
      await dataSource.toggleRefeicao(id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Receita>> getReceitas() async {
    try {
      final receitaModels = await dataSource.getReceitas();
      return receitaModels.map((model) => model.toEntity()).toList();
    } catch (e) {
      rethrow;
    }
  }
}
