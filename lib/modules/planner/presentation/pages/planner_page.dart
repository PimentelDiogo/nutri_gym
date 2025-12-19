import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../controllers/planner_controller.dart';
import '../widgets/next_appointment_card.dart';
import '../widgets/nutri_message_card.dart';
import '../widgets/profile_header_widget.dart';
import '../widgets/weight_evolution_chart.dart';

/// Planner page for profile and evolution tracking
class PlannerPage extends GetView<PlannerController> {
  const PlannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDark,
        title: const Text('Meu Plano'),
      ),
      body: Obx(() {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Profile Header
              ProfileHeaderWidget(
                nome: controller.nomeUsuario.value,
                status: controller.statusPlano.value,
              ),
              const SizedBox(height: 16),

              // Nutri Message
              NutriMessageCard(
                mensagem: controller.ultimaMensagemNutri.value,
                onResponder: controller.responderMensagem,
              ),
              const SizedBox(height: 16),

              // Next Appointment
              NextAppointmentCard(
                dataHora: controller.proximaConsulta.value,
                onRemarcar: controller.remarcarConsulta,
              ),
              const SizedBox(height: 16),

              // Weight Evolution Chart
              WeightEvolutionChart(historico: controller.historicoPeso),
            ],
          ),
        );
      }),
    );
  }
}
