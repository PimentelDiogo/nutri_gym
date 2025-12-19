/// Resumo do dashboard do usuário
class DashboardSummary {
  final double pesoAtual;
  final double pesoMeta;
  final int caloriasConsumidas;
  final int caloriasMeta;
  final String proximoTreinoTitulo;
  final String proximoTreinoTipo;

  const DashboardSummary({
    required this.pesoAtual,
    required this.pesoMeta,
    required this.caloriasConsumidas,
    required this.caloriasMeta,
    required this.proximoTreinoTitulo,
    required this.proximoTreinoTipo,
  });

  /// Calcula o percentual de progresso do peso
  double get pesoProgresso {
    if (pesoMeta == 0) return 0;
    return ((pesoAtual / pesoMeta) * 100).clamp(0, 100);
  }

  /// Calcula o percentual de calorias consumidas
  double get caloriasProgresso {
    if (caloriasMeta == 0) return 0;
    return ((caloriasConsumidas / caloriasMeta) * 100).clamp(0, 100);
  }

  @override
  String toString() {
    return 'DashboardSummary(peso: $pesoAtual/$pesoMeta, calorias: $caloriasConsumidas/$caloriasMeta)';
  }
}
