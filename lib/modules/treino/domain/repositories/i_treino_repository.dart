import '../entities/treino.dart';
import '../entities/treino_semanal.dart';

/// Treino repository interface
abstract class ITreinoRepository {
  Future<Treino> getTreinoDoDia();
  Future<List<TreinoSemanal>> getTreinosSemana(DateTime dataInicio);
}
