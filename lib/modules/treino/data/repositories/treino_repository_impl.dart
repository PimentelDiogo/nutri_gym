import '../../domain/entities/treino.dart';
import '../../domain/repositories/i_treino_repository.dart';
import '../datasources/treino_datasource.dart';

/// Implementação do repositório de treinos
class TreinoRepositoryImpl implements ITreinoRepository {
  final TreinoLocalDataSource dataSource;

  const TreinoRepositoryImpl(this.dataSource);

  @override
  Future<Treino> getTreinoDoDia(DateTime data) async {
    try {
      final treinoModel = await dataSource.getTreinoDoDia(data);
      return treinoModel.toEntity();
    } catch (e) {
      // Em um caso real, aqui você converteria exceptions para failures
      rethrow;
    }
  }
}
