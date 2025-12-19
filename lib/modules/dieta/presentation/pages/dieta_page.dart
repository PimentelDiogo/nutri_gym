import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/dieta_controller.dart';
import '../widgets/macro_summary_bar.dart';
import '../widgets/meal_item_widget.dart';
import '../widgets/recipe_grid_item.dart';

/// Dieta page for nutrition management
class DietaPage extends GetView<DietaController> {
  const DietaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.backgroundDark,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundDark,
          title: const Text('Nutrição'),
          bottom: const TabBar(
            indicatorColor: AppColors.primaryBlue,
            labelColor: AppColors.primaryBlue,
            unselectedLabelColor: AppColors.textSilver,
            tabs: [
              Tab(text: 'Plano Diário'),
              Tab(text: 'Receitas'),
            ],
          ),
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
          return TabBarView(children: [_buildPlanoTab(), _buildReceitasTab()]);
        }),
      ),
    );
  }

  Widget _buildPlanoTab() {
    return Obx(() {
      if (controller.planoDia.isEmpty) {
        return const Center(
          child: Text(
            'Nenhum plano disponível',
            style: TextStyle(color: AppColors.textSilver, fontSize: 16),
          ),
        );
      }

      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Header com total de calorias
          Card(
            color: AppColors.cardDark,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Calorias Consumidas',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${controller.caloriasConsumidas.toStringAsFixed(0)} / ${controller.totalCaloriasDia.toStringAsFixed(0)} kcal',
                    style: const TextStyle(
                      color: AppColors.primaryBlue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Lista de refeições
          ...controller.planoDia.asMap().entries.map((entry) {
            final index = entry.key;
            final refeicao = entry.value;

            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: MealItemWidget(
                refeicao: refeicao,
                onCheckboxTap: () => controller.marcarRefeicao(index),
              ),
            );
          }),

          const SizedBox(height: 16),

          // Resumo de macros
          MacroSummaryBar(
            proteina: controller.macrosConsumidos['proteina'] ?? 0,
            carboidrato: controller.macrosConsumidos['carboidrato'] ?? 0,
            gordura: controller.macrosConsumidos['gordura'] ?? 0,
          ),
        ],
      );
    });
  }

  Widget _buildReceitasTab() {
    return Obx(() {
      if (controller.receitas.isEmpty) {
        return const Center(
          child: Text(
            'Nenhuma receita disponível',
            style: TextStyle(color: AppColors.textSilver, fontSize: 16),
          ),
        );
      }

      return GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: controller.receitas.length,
        itemBuilder: (context, index) {
          final receita = controller.receitas[index];
          return RecipeGridItem(
            receita: receita,
            onTap: () {
              Get.snackbar(
                'Receita',
                receita.titulo,
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: AppColors.cardDark,
                colorText: Colors.white,
              );
            },
          );
        },
      );
    });
  }
}
