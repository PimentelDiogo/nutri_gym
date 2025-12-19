import 'alimento.dart';

/// Entidade de refeição
class Refeicao {
  final String id;
  final String nome;
  final String horario;
  final List<Alimento> alimentos;
  final bool realizado;

  const Refeicao({
    required this.id,
    required this.nome,
    required this.horario,
    required this.alimentos,
    this.realizado = false,
  });

  /// Calcula o total de calorias da refeição
  double get totalCalorias {
    return alimentos.fold(0, (sum, alimento) => sum + alimento.calorias);
  }

  /// Calcula o total de proteínas
  double get totalProteina {
    return alimentos.fold(0, (sum, alimento) => sum + alimento.proteina);
  }

  /// Calcula o total de carboidratos
  double get totalCarboidrato {
    return alimentos.fold(0, (sum, alimento) => sum + alimento.carboidrato);
  }

  /// Calcula o total de gorduras
  double get totalGordura {
    return alimentos.fold(0, (sum, alimento) => sum + alimento.gordura);
  }

  /// Cria uma cópia com campos atualizados
  Refeicao copyWith({
    String? id,
    String? nome,
    String? horario,
    List<Alimento>? alimentos,
    bool? realizado,
  }) {
    return Refeicao(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      horario: horario ?? this.horario,
      alimentos: alimentos ?? this.alimentos,
      realizado: realizado ?? this.realizado,
    );
  }

  @override
  String toString() {
    return 'Refeicao(nome: $nome, horario: $horario, calorias: $totalCalorias)';
  }
}
