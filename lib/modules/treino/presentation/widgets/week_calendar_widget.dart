import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/treino_controller.dart';
import 'day_workout_card.dart';

/// Widget de calendário semanal
class WeekCalendarWidget extends GetView<TreinoController> {
  const WeekCalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.semanaAtual.isEmpty) {
        return const SizedBox.shrink();
      }

      return Column(
        children: [
          // Navegação de semana
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: controller.semanaAnterior,
                icon: const Icon(Icons.chevron_left, color: Colors.white),
              ),
              Text(
                _getWeekRange(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              IconButton(
                onPressed: controller.proximaSemana,
                icon: const Icon(Icons.chevron_right, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Dias da semana
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(controller.semanaAtual.length, (index) {
                final treino = controller.semanaAtual[index];
                final isSelected = controller.diaSelecionado == index;
                return Padding(
                  padding: EdgeInsets.only(left: index == 0 ? 0 : 8),
                  child: DayWorkoutCard(
                    treino: treino,
                    isSelected: isSelected,
                    onTap: () => controller.selecionarDia(index),
                  ),
                );
              }),
            ),
          ),
        ],
      );
    });
  }

  String _getWeekRange() {
    if (controller.semanaAtual.isEmpty) return '';
    final first = controller.semanaAtual.first.data;
    final last = controller.semanaAtual.last.data;
    return '${first.day}/${first.month} - ${last.day}/${last.month}';
  }
}
