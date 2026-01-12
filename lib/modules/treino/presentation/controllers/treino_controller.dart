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
  final _isLoadingExercicios = false.obs;
  final Rx<Treino?> _treino = Rx<Treino?>(null);
  final RxList<TreinoSemanal> semanaAtual = <TreinoSemanal>[].obs;
  final _diaSelecionado = 0.obs;
  final _error = ''.obs;
  final _mostrarExercicios = false.obs;

  // Getters
  bool get isLoading => _isLoading.value;
  bool get isLoadingExercicios => _isLoadingExercicios.value;
  Treino? get treino => _treino.value;
  String get error => _error.value;
  int get diaSelecionado => _diaSelecionado.value;
  bool get mostrarExercicios => _mostrarExercicios.value;
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
      if (!hoje.isBefore(segundaFeira) &&
          hoje.isBefore(segundaFeira.add(const Duration(days: 7)))) {
        _diaSelecionado.value = hoje.weekday - 1;
      } else {
        _diaSelecionado.value = 0;
      }

      // Reseta o estado de exercícios
      _mostrarExercicios.value = false;
      _treino.value = null;
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
      // Reseta o estado de exercícios ao mudar de dia
      _mostrarExercicios.value = false;
      _treino.value = null;
    }
  }

  /// Toggle para mostrar/ocultar exercícios
  Future<void> toggleExercicios() async {
    if (_mostrarExercicios.value) {
      _mostrarExercicios.value = false;
    } else {
      // Se não tem os exercícios carregados, carrega
      if (_treino.value == null) {
        await carregarTreinoDoDia();
      }
      _mostrarExercicios.value = true;
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

  /// Carrega o treino do dia selecionado
  Future<void> carregarTreinoDoDia() async {
    try {
      _isLoadingExercicios.value = true;
      _error.value = '';

      // Usa a data do treino selecionado se disponível
      final dataSelecionada = treinoSelecionado?.data;
      final treinoCarregado = await getTreinoDoDiaUseCase(
        data: dataSelecionada,
      );
      _treino.value = treinoCarregado;
    } catch (e) {
      _error.value = 'Erro ao carregar treino: $e';
    } finally {
      _isLoadingExercicios.value = false;
    }
  }

  /// Recarrega o treino
  Future<void> recarregar() async {
    await carregarSemana(DateTime.now());
  }
}
