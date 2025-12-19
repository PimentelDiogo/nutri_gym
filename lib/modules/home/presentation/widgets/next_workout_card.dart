import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

/// Card do próximo treino
class NextWorkoutCard extends StatelessWidget {
  final String titulo;
  final String tipo;
  final VoidCallback? onTap;

  const NextWorkoutCard({
    super.key,
    required this.titulo,
    required this.tipo,
    this.onTap,
  });

  IconData get icone {
    return tipo.toUpperCase() == 'FORCA'
        ? Icons.fitness_center
        : Icons.directions_run;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.cardDark,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.primaryBlue.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            // Ícone
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: AppColors.primaryBlue.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icone, color: AppColors.primaryBlue, size: 32),
            ),
            const SizedBox(width: 16),

            // Texto
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Próximo Treino',
                    style: TextStyle(color: AppColors.textSilver, fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    titulo,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlue.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      tipo.toUpperCase(),
                      style: const TextStyle(
                        color: AppColors.primaryBlue,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Seta
            const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.primaryBlue,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
