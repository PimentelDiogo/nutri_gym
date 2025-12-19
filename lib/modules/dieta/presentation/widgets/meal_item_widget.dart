import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/refeicao.dart';

/// Widget de item de refeição
class MealItemWidget extends StatelessWidget {
  final Refeicao refeicao;
  final VoidCallback? onCheckboxTap;

  const MealItemWidget({super.key, required this.refeicao, this.onCheckboxTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardDark,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Horário e Nome
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    refeicao.horario,
                    style: TextStyle(
                      color: AppColors.textSilver.withValues(alpha: 0.7),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    refeicao.nome,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Lista de alimentos
                  ...refeicao.alimentos
                      .take(2)
                      .map(
                        (alimento) => Padding(
                          padding: const EdgeInsets.only(bottom: 2),
                          child: Text(
                            '• ${alimento.nome}',
                            style: const TextStyle(
                              color: AppColors.textSilver,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                  if (refeicao.alimentos.length > 2)
                    Text(
                      '+ ${refeicao.alimentos.length - 2} mais',
                      style: TextStyle(
                        color: AppColors.textSilver.withValues(alpha: 0.6),
                        fontSize: 11,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  const SizedBox(height: 8),
                  Text(
                    '${refeicao.totalCalorias.toStringAsFixed(0)} kcal',
                    style: const TextStyle(
                      color: AppColors.primaryBlue,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            // Checkbox
            GestureDetector(
              onTap: onCheckboxTap,
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: refeicao.realizado
                      ? AppColors.primaryBlue
                      : Colors.transparent,
                  border: Border.all(
                    color: refeicao.realizado
                        ? AppColors.primaryBlue
                        : AppColors.textSilver.withValues(alpha: 0.5),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: refeicao.realizado
                    ? const Icon(Icons.check, color: Colors.white, size: 18)
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
