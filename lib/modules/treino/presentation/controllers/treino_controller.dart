import 'package:get/get.dart';
import '../../domain/entities/treino.dart';
import '../../domain/entities/treino_semanal.dart';
import '../../domain/usecases/get_treino_do_dia_usecase.dart';
import '../../domain/usecases/get_treino_semanal_usecase.dart';

/// Treino controller managing workout state
class TreinoController extends GetxController {
  final GetTreinoDoDiaUseCase getTreinoDoDiaUseCase;
  final GetTreinoSemanalUseCase getTreinoSemanalUseCase;

  TreinoController({
    required this.getTreinoDoDiaUseCase,
    required this.getTreinoSemanalUseCase,
  });

  // Estado reativo
  final _isLoading = false.obs;
  final Rx<Treino?> _treino = Rx<Treino?>(null);
  final RxList<TreinoSemanal> semanaAtual = <TreinoSemanal>[].obs;
  final _diaSelecionado = 0.obs;
  final _error = ''.obs;

  // Getters
  bool get isLoading => _isLoading.value;
  Treino? get treino => _treino.value;
  String get error => _error.value;
  int get diaSelecionado => _diaSelecionado.value;
  TreinoSemanal? get treinoSelecionado =>
      semanaAtual.isNotEmpty ? semanaAtual[_diaSelecionado.value] : null;

  @override
  void onInit() {
    super.onInit();
    carregarSemana(DateTime.now());
  }

  /// Carrega treinos da semana
  Future<void> carregarSemana(DateTime dataInicio) async {
    try {
      _isLoading.value = true;
      _error.value = '';

      // Ajusta para segunda-feira da semana
      final segundaFeira = dataInicio.subtract(
        Duration(days: (dataInicio.weekday - 1) % 7),
      );

      final treinos = await getTreinoSemanalUseCase(segundaFeira);
      semanaAtual.value = treinos;

      // Seleciona o dia atual se estiver na semana
      final hoje = DateTime.now();
      if (hoje.isAfter(segundaFeira) &&
          hoje.isBefore(segundaFeira.add(const Duration(days: 7)))) {
        _diaSelecionado.value = hoje.weekday - 1;
      } else {
        _diaSelecionado.value = 0;
      }
    } catch (e) {
      _error.value = 'Erro ao carregar semana: $e';
    } finally {
      _isLoading.value = false;
    }
  }

  /// Seleciona um dia da semana
  void selecionarDia(int index) {
    if (index >= 0 && index < semanaAtual.length) {
      _diaSelecionado.value = index;
    }
  }

  /// Navega para semana anterior
  Future<void> semanaAnterior() async {
    if (semanaAtual.isNotEmpty) {
      final novaData = semanaAtual.first.data.subtract(const Duration(days: 7));
      await carregarSemana(novaData);
    }
  }

  /// Navega para próxima semana
  Future<void> proximaSemana() async {
    if (semanaAtual.isNotEmpty) {
      final novaData = semanaAtual.first.data.add(const Duration(days: 7));
      await carregarSemana(novaData);
    }
  }

  /// Carrega o treino do dia (mantido para compatibilidade)
  Future<void> carregarTreinoDoDia() async {
    try {
      _isLoading.value = true;
      _error.value = '';

      final treinoCarregado = await getTreinoDoDiaUseCase();
      _treino.value = treinoCarregado;
    } catch (e) {
      _error.value = 'Erro ao carregar treino: $e';
    } finally {
      _isLoading.value = false;
    }
  }

  /// Recarrega o treino
  Future<void> recarregar() async {
    await carregarSemana(DateTime.now());
  }
}
