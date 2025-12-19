import '../../domain/entities/treino.dart';
import '../../domain/entities/treino_semanal.dart';
import '../../domain/repositories/i_treino_repository.dart';
import '../datasources/treino_datasource.dart';

/// Implementação do repositório de treinos
class TreinoRepositoryImpl implements ITreinoRepository {
  final TreinoLocalDataSource dataSource;

  const TreinoRepositoryImpl(this.dataSource);

  @override
  Future<Treino> getTreinoDoDia() async {
    try {
      final treinoModel = await dataSource.getTreinoDoDia();
      return treinoModel.toEntity();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<TreinoSemanal>> getTreinosSemana(DateTime dataInicio) async {
    try {
      final treinosModel = await dataSource.getTreinosSemana(dataInicio);
      return treinosModel.map((model) => model.toEntity()).toList();
    } catch (e) {
      rethrow;
    }
  }
}
