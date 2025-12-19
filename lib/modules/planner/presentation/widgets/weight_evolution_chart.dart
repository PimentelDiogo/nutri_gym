import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/planner_controller.dart';

/// Gráfico de evolução de peso
class WeightEvolutionChart extends StatelessWidget {
  final List<HistoricoPeso> historico;

  const WeightEvolutionChart({super.key, required this.historico});

  @override
  Widget build(BuildContext context) {
    if (historico.isEmpty) {
      return const SizedBox.shrink();
    }

    final minPeso = historico
        .map((h) => h.peso)
        .reduce((a, b) => a < b ? a : b);
    final maxPeso = historico
        .map((h) => h.peso)
        .reduce((a, b) => a > b ? a : b);
    final range = maxPeso - minPeso;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Evolução de Peso (7 dias)',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),

          // Gráfico simplificado
          SizedBox(
            height: 140,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: historico.map((item) {
                final normalizedHeight = range > 0
                    ? ((item.peso - minPeso) / range) * 70 + 15
                    : 50.0;

                return Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 140),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Valor
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              item.peso.toStringAsFixed(1),
                              style: const TextStyle(
                                color: AppColors.primaryBlue,
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 2),

                          // Barra
                          Container(
                            height: normalizedHeight,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  AppColors.primaryBlue,
                                  AppColors.primaryBlue.withValues(alpha: 0.5),
                                ],
                              ),
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(4),
                              ),
                            ),
                          ),
                          const SizedBox(height: 2),

                          // Data
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              '${item.data.day}/${item.data.month}',
                              style: TextStyle(
                                color: AppColors.textSilver.withValues(
                                  alpha: 0.7,
                                ),
                                fontSize: 8,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
