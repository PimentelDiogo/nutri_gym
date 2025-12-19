import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../../../core/theme/app_colors.dart';

/// Widget de barra de calorias
class CalorieBarWidget extends StatelessWidget {
  final int caloriasConsumidas;
  final int caloriasMeta;

  const CalorieBarWidget({
    super.key,
    required this.caloriasConsumidas,
    required this.caloriasMeta,
  });

  double get progresso {
    if (caloriasMeta == 0) return 0;
    return (caloriasConsumidas / caloriasMeta).clamp(0, 1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Calorias',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '$caloriasConsumidas / $caloriasMeta kcal',
                style: const TextStyle(
                  color: AppColors.textSilver,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          LinearPercentIndicator(
            padding: EdgeInsets.zero,
            lineHeight: 12,
            percent: progresso,
            progressColor: Colors.cyan,
            backgroundColor: AppColors.backgroundDark,
            barRadius: const Radius.circular(6),
            animation: true,
            animationDuration: 1000,
          ),
          const SizedBox(height: 8),
          Text(
            '${(progresso * 100).toStringAsFixed(0)}% da meta diária',
            style: TextStyle(
              color: AppColors.textSilver.withValues(alpha: 0.7),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
