import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/treino_controller.dart';
import '../widgets/week_calendar_widget.dart';
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
        title: const Text('Treinos'),
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
                    child: const Text('Tentar Novamente'),
                  ),
                ],
              ),
            ),
          );
        }

        // Success state
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Calendário semanal
            const WeekCalendarWidget(),
            const SizedBox(height: 24),

            // Detalhes do dia selecionado
            _buildDayDetails(),
          ],
        );
      }),
    );
  }

  Widget _buildDayDetails() {
    final treinoSelecionado = controller.treinoSelecionado;

    if (treinoSelecionado == null) {
      return const SizedBox.shrink();
    }

    if (!treinoSelecionado.temTreino) {
      return Card(
        color: AppColors.cardDark,
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              Icon(
                Icons.free_breakfast,
                size: 64,
                color: AppColors.textSilver.withValues(alpha: 0.5),
              ),
              const SizedBox(height: 16),
              const Text(
                'Dia de Descanso',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Aproveite para recuperar!',
                style: TextStyle(color: AppColors.textSilver, fontSize: 14),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Card do treino clicável
        GestureDetector(
          onTap: () {
            controller.toggleExercicios();
          },
          child: Card(
            color: AppColors.cardDark,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          treinoSelecionado.titulo ?? '',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Obx(
                        () => Icon(
                          controller.mostrarExercicios
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: AppColors.textSilver,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: treinoSelecionado.tipo == 'FORCA'
                          ? AppColors.primaryBlue
                          : Colors.cyan,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      treinoSelecionado.tipo ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(
                        Icons.touch_app,
                        color: AppColors.textSilver.withValues(alpha: 0.7),
                        size: 16,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        controller.mostrarExercicios
                            ? 'Toque para ocultar exercícios'
                            : 'Toque para ver os exercícios detalhados',
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
        ),

        // Lista de exercícios (expandível)
        Obx(() {
          if (!controller.mostrarExercicios) {
            return const SizedBox.shrink();
          }

          if (controller.isLoadingExercicios) {
            return const Padding(
              padding: EdgeInsets.all(32),
              child: Center(
                child: CircularProgressIndicator(color: AppColors.primaryBlue),
              ),
            );
          }

          final treino = controller.treino;
          if (treino == null || treino.exercicios.isEmpty) {
            return Card(
              color: AppColors.cardDark,
              margin: const EdgeInsets.only(top: 8),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    'Nenhum exercício encontrado',
                    style: TextStyle(color: AppColors.textSilver),
                  ),
                ),
              ),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const Text(
                'Exercícios',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              ...treino.exercicios.asMap().entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: ExerciseCard(
                    exercicio: entry.value,
                    numero: entry.key + 1,
                    onVideoTap: () {
                      // TODO: Implementar reprodução de vídeo
                      Get.snackbar(
                        'Vídeo',
                        'Em breve: ${entry.value.nome}',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: AppColors.cardDark,
                        colorText: Colors.white,
                      );
                    },
                  ),
                );
              }),
            ],
          );
        }),
      ],
    );
  }
}
