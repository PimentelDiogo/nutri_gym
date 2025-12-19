import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../../../core/theme/app_colors.dart';

/// Widget de peso circular
class WeightCircularWidget extends StatelessWidget {
  final double pesoAtual;
  final double pesoMeta;

  const WeightCircularWidget({
    super.key,
    required this.pesoAtual,
    required this.pesoMeta,
  });

  double get progresso {
    if (pesoMeta == 0) return 0;
    return (pesoAtual / pesoMeta).clamp(0, 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Peso Atual',
          style: TextStyle(
            color: AppColors.textSilver.withValues(alpha: 0.8),
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 16),
        CircularPercentIndicator(
          radius: 80,
          lineWidth: 12,
          percent: progresso,
          center: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                pesoAtual.toStringAsFixed(1),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'kg',
                style: TextStyle(color: AppColors.textSilver, fontSize: 16),
              ),
            ],
          ),
          progressColor: AppColors.primaryBlue,
          backgroundColor: AppColors.cardDark,
          circularStrokeCap: CircularStrokeCap.round,
          animation: true,
          animationDuration: 1200,
        ),
        const SizedBox(height: 12),
        Text(
          'Meta: ${pesoMeta.toStringAsFixed(1)} kg',
          style: const TextStyle(color: AppColors.textSilver, fontSize: 14),
        ),
      ],
    );
  }
}
