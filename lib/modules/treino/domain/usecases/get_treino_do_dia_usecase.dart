import '../entities/treino.dart';
import '../repositories/i_treino_repository.dart';

/// Use case para buscar o treino do dia
class GetTreinoDoDiaUseCase {
  final ITreinoRepository repository;

  const GetTreinoDoDiaUseCase(this.repository);

  /// Executa o caso de uso
  /// Se [data] for fornecida, retorna o treino para aquele dia específico
  Future<Treino> call({DateTime? data}) async {
    return await repository.getTreinoDoDia(data: data);
  }
}
