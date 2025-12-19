import 'package:get/get.dart';
import '../../domain/entities/dashboard_summary.dart';
import '../../domain/usecases/get_home_summary_usecase.dart';

/// Home controller managing dashboard state
class HomeController extends GetxController {
  final GetHomeSummaryUseCase getHomeSummaryUseCase;

  HomeController(this.getHomeSummaryUseCase);

  // Estado reativo
  final _isLoading = false.obs;
  final Rx<DashboardSummary?> _summary = Rx<DashboardSummary?>(null);
  final _error = ''.obs;

  // Getters
  bool get isLoading => _isLoading.value;
  DashboardSummary? get summary => _summary.value;
  String get error => _error.value;

  @override
  void onInit() {
    super.onInit();
    carregarSummary();
  }

  /// Carrega o resumo do dashboard
  Future<void> carregarSummary() async {
    try {
      _isLoading.value = true;
      _error.value = '';

      final summaryCarregado = await getHomeSummaryUseCase();

      _summary.value = summaryCarregado;
    } catch (e) {
      _error.value = 'Erro ao carregar resumo: $e';
    } finally {
      _isLoading.value = false;
    }
  }

  /// Recarrega o resumo
  Future<void> recarregar() async {
    await carregarSummary();
  }
}
