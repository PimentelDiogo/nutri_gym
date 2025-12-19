import '../entities/receita.dart';
import '../repositories/i_dieta_repository.dart';

/// Use case para buscar receitas sugeridas
class GetReceitasSugeridasUseCase {
  final IDietaRepository repository;

  const GetReceitasSugeridasUseCase(this.repository);

  /// Executa o caso de uso
  Future<List<Receita>> call() async {
    return await repository.getReceitas();
  }
}
