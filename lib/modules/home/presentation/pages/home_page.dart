import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/main_shell.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/home_controller.dart';
import '../widgets/calorie_bar_widget.dart';
import '../widgets/next_workout_card.dart';
import '../widgets/weight_circular_widget.dart';

/// Home dashboard page
class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: SafeArea(
        child: Obx(() {
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
                    const Icon(
                      Icons.error_outline,
                      size: 64,
                      color: Colors.red,
                    ),
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
          final summary = controller.summary;
          if (summary == null) {
            return const Center(
              child: Text(
                'Nenhum dado disponível',
                style: TextStyle(color: AppColors.textSilver, fontSize: 16),
              ),
            );
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Olá,',
                            style: TextStyle(
                              color: AppColors.textSilver.withValues(
                                alpha: 0.8,
                              ),
                              fontSize: 16,
                            ),
                          ),
                          const Text(
                            'Atleta',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: AppColors.primaryBlue,
                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),

                  // Weight Circular Widget
                  Center(
                    child: WeightCircularWidget(
                      pesoAtual: summary.pesoAtual,
                      pesoMeta: summary.pesoMeta,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Calorie Bar Widget
                  CalorieBarWidget(
                    caloriasConsumidas: summary.caloriasConsumidas,
                    caloriasMeta: summary.caloriasMeta,
                  ),
                  const SizedBox(height: 20),

                  // Next Workout Card
                  NextWorkoutCard(
                    titulo: summary.proximoTreinoTitulo,
                    tipo: summary.proximoTreinoTipo,
                    onTap: () {
                      // Navega para a aba de Treino (índice 1)
                      final mainController = Get.find<MainShellController>();
                      mainController.changePage(1);
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
