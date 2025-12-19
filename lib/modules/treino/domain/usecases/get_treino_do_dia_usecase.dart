import '../entities/treino.dart';
import '../repositories/i_treino_repository.dart';

/// Use case para buscar o treino do dia
class GetTreinoDoDiaUseCase {
  final ITreinoRepository repository;

  const GetTreinoDoDiaUseCase(this.repository);

  /// Executa o caso de uso
  Future<Treino> call() async {
    return await repository.getTreinoDoDia();
  }
}
