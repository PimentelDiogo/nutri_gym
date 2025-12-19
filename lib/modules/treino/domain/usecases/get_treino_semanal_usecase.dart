import '../entities/treino_semanal.dart';
import '../repositories/i_treino_repository.dart';

/// Use case para obter treinos da semana
class GetTreinoSemanalUseCase {
  final ITreinoRepository repository;

  GetTreinoSemanalUseCase(this.repository);

  Future<List<TreinoSemanal>> call(DateTime dataInicio) async {
    return await repository.getTreinosSemana(dataInicio);
  }
}
