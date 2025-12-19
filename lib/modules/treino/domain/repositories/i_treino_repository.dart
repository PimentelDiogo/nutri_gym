import '../entities/treino.dart';

/// Interface do repositório de treinos
abstract class ITreinoRepository {
  /// Busca o treino do dia especificado
  Future<Treino> getTreinoDoDia(DateTime data);
}
