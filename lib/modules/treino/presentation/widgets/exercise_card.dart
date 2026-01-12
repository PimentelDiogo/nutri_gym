import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/exercicio.dart';

/// Card de exercício estilizado
class ExerciseCard extends StatelessWidget {
  final Exercicio exercicio;
  final int numero;
  final VoidCallback? onVideoTap;

  const ExerciseCard({
    super.key,
    required this.exercicio,
    required this.numero,
    this.onVideoTap,
  });

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
            // Número do exercício
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.primaryBlue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  '$numero',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),

            // Informações do exercício
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nome do exercício
                  Text(
                    exercicio.nome,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Séries e repetições
                  Text(
                    '${exercicio.series} séries × ${exercicio.repeticoes}',
                    style: const TextStyle(
                      color: AppColors.textSilver,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            // Botão de vídeo
            if (exercicio.urlVideo != null)
              IconButton(
                icon: const Icon(
                  Icons.play_circle_outline,
                  color: AppColors.primaryBlue,
                  size: 32,
                ),
                onPressed: onVideoTap,
              ),
          ],
        ),
      ),
    );
  }
}
