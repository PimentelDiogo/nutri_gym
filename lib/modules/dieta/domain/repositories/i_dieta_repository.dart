import '../entities/receita.dart';
import '../entities/refeicao.dart';

/// Interface do repositório de dieta
abstract class IDietaRepository {
  /// Busca o plano nutricional do dia
  Future<List<Refeicao>> getPlanoDoDia();

  /// Alterna o status de realizado de uma refeição
  Future<void> toggleRefeicao(String id);

  /// Busca receitas sugeridas
  Future<List<Receita>> getReceitas();
}
