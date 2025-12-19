import 'package:get/get.dart';
import '../../domain/entities/treino.dart';
import '../../domain/usecases/get_treino_do_dia_usecase.dart';

/// Treino controller managing workout state
class TreinoController extends GetxController {
  final GetTreinoDoDiaUseCase getTreinoDoDiaUseCase;

  TreinoController(this.getTreinoDoDiaUseCase);

  // Estado reativo
  final _isLoading = false.obs;
  final Rx<Treino?> _treino = Rx<Treino?>(null);
  final _error = ''.obs;

  // Getters
  bool get isLoading => _isLoading.value;
  Treino? get treino => _treino.value;
  String get error => _error.value;

  @override
  void onInit() {
    super.onInit();
    carregarTreinoDoDia();
  }

  /// Carrega o treino do dia
  Future<void> carregarTreinoDoDia() async {
    try {
      _isLoading.value = true;
      _error.value = '';

      final hoje = DateTime.now();
      final treinoCarregado = await getTreinoDoDiaUseCase(hoje);

      _treino.value = treinoCarregado;
    } catch (e) {
      _error.value = 'Erro ao carregar treino: $e';
    } finally {
      _isLoading.value = false;
    }
  }

  /// Recarrega o treino
  Future<void> recarregar() async {
    await carregarTreinoDoDia();
  }
}
