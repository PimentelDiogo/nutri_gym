import '../entities/refeicao.dart';
import '../repositories/i_dieta_repository.dart';

/// Use case para buscar o plano nutricional do dia
class GetPlanoNutricionalUseCase {
  final IDietaRepository repository;

  const GetPlanoNutricionalUseCase(this.repository);

  /// Executa o caso de uso
  Future<List<Refeicao>> call() async {
    return await repository.getPlanoDoDia();
  }
}
