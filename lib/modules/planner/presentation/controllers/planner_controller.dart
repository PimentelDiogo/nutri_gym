import 'package:get/get.dart';

/// Histórico de peso
class HistoricoPeso {
  final DateTime data;
  final double peso;

  const HistoricoPeso({required this.data, required this.peso});
}

/// Planner controller managing profile and evolution
class PlannerController extends GetxController {
  // Dados do usuário
  final nomeUsuario = 'Atleta'.obs;
  final statusPlano = 'Plano Hypertrofia Ativo'.obs;
  final proximaConsulta = '15/Nov às 10:00'.obs;
  final ultimaMensagemNutri =
      'Parabéns pela evolução desta semana! Continue assim 💪'.obs;

  // Histórico de peso (últimos 7 dias)
  final RxList<HistoricoPeso> historicoPeso = <HistoricoPeso>[].obs;

  @override
  void onInit() {
    super.onInit();
    _carregarHistorico();
  }

  void _carregarHistorico() {
    final hoje = DateTime.now();
    historicoPeso.value = [
      HistoricoPeso(data: hoje.subtract(const Duration(days: 6)), peso: 77.5),
      HistoricoPeso(data: hoje.subtract(const Duration(days: 5)), peso: 77.2),
      HistoricoPeso(data: hoje.subtract(const Duration(days: 4)), peso: 76.8),
      HistoricoPeso(data: hoje.subtract(const Duration(days: 3)), peso: 76.5),
      HistoricoPeso(data: hoje.subtract(const Duration(days: 2)), peso: 76.0),
      HistoricoPeso(data: hoje.subtract(const Duration(days: 1)), peso: 75.5),
      HistoricoPeso(data: hoje, peso: 75.0),
    ];
  }

  void responderMensagem() {
    Get.snackbar(
      'Chat',
      'Abrindo conversa com nutricionista...',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void remarcarConsulta() {
    Get.snackbar(
      'Consulta',
      'Abrindo agenda...',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
