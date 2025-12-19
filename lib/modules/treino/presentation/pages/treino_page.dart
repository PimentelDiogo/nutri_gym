import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/exercicio.dart';
import '../controllers/treino_controller.dart';
import '../widgets/exercise_card.dart';

/// Treino page for workout management
class TreinoPage extends GetView<TreinoController> {
  const TreinoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDark,
        title: const Text('Treino do Dia'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: controller.recarregar,
          ),
        ],
      ),
      body: Obx(() {
        // Loading state
        if (controller.isLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.primaryBlue),
          );
        }

        // Error state
        if (controller.error.isNotEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    controller.error,
                    style: const TextStyle(
                      color: AppColors.textSilver,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: controller.recarregar,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue,
                    ),
                    child: const Text('Tentar Novamente'),
                  ),
                ],
              ),
            ),
          );
        }

        // Empty state
        final treino = controller.treino;
        if (treino == null) {
          return const Center(
            child: Text(
              'Nenhum treino disponível',
              style: TextStyle(color: AppColors.textSilver, fontSize: 16),
            ),
          );
        }

        // Success state - Display workout
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Header Card
            Card(
              color: AppColors.cardDark,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Título do treino
                    Text(
                      treino.titulo,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Tipo e quantidade
                    Row(
                      children: [
                        // Tag de tipo
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: treino.tipo.name == 'forca'
                                ? AppColors.primaryBlue
                                : Colors.cyan,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                treino.tipo.name == 'forca'
                                    ? Icons.fitness_center
                                    : Icons.directions_run,
                                size: 16,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                treino.tipo.name == 'forca'
                                    ? 'FORÇA'
                                    : 'AERÓBICO',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),

                        // Quantidade de exercícios
                        Text(
                          '${treino.exercicios.length} exercícios',
                          style: const TextStyle(
                            color: AppColors.textSilver,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Lista de exercícios
            ...treino.exercicios.asMap().entries.map((entry) {
              final index = entry.key;
              final exercicio = entry.value;

              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: ExerciseCard(
                  exercicio: exercicio,
                  numero: index + 1,
                  onVideoTap: exercicio.urlVideo != null
                      ? () => _mostrarVideo(exercicio)
                      : null,
                ),
              );
            }),
          ],
        );
      }),
    );
  }

  void _mostrarVideo(Exercicio exercicio) {
    Get.snackbar(
      'Vídeo',
      'Abrindo vídeo: ${exercicio.nome}',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.cardDark,
      colorText: Colors.white,
      icon: const Icon(Icons.play_circle, color: AppColors.primaryBlue),
    );
  }
}
