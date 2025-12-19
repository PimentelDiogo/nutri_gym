import 'package:get/get.dart';
import '../../domain/entities/receita.dart';
import '../../domain/entities/refeicao.dart';
import '../../domain/usecases/get_plano_nutricional_usecase.dart';
import '../../domain/usecases/get_receitas_sugeridas_usecase.dart';

/// Dieta controller managing nutrition state
class DietaController extends GetxController {
  final GetPlanoNutricionalUseCase getPlanoNutricionalUseCase;
  final GetReceitasSugeridasUseCase getReceitasSugeridasUseCase;

  DietaController({
    required this.getPlanoNutricionalUseCase,
    required this.getReceitasSugeridasUseCase,
  });

  // Estado reativo
  final _isLoading = false.obs;
  final RxList<Refeicao> planoDia = <Refeicao>[].obs;
  final RxList<Receita> receitas = <Receita>[].obs;
  final _error = ''.obs;

  // Getters
  bool get isLoading => _isLoading.value;
  String get error => _error.value;

  // Calcula total de calorias do dia
  double get totalCaloriasDia {
    return planoDia.fold(0, (sum, refeicao) => sum + refeicao.totalCalorias);
  }

  // Calcula calorias consumidas (apenas refeições realizadas)
  double get caloriasConsumidas {
    return planoDia
        .where((refeicao) => refeicao.realizado)
        .fold(0, (sum, refeicao) => sum + refeicao.totalCalorias);
  }

  // Calcula macros consumidos
  Map<String, double> get macrosConsumidos {
    final refeicoesConcluidas = planoDia.where((r) => r.realizado);
    return {
      'proteina': refeicoesConcluidas.fold(
        0.0,
        (sum, r) => sum + r.totalProteina,
      ),
      'carboidrato': refeicoesConcluidas.fold(
        0.0,
        (sum, r) => sum + r.totalCarboidrato,
      ),
      'gordura': refeicoesConcluidas.fold(
        0.0,
        (sum, r) => sum + r.totalGordura,
      ),
    };
  }

  @override
  void onInit() {
    super.onInit();
    carregarDados();
  }

  /// Carrega plano nutricional e receitas
  Future<void> carregarDados() async {
    try {
      _isLoading.value = true;
      _error.value = '';

      // Carrega em paralelo
      final results = await Future.wait([
        getPlanoNutricionalUseCase(),
        getReceitasSugeridasUseCase(),
      ]);

      planoDia.value = results[0] as List<Refeicao>;
      receitas.value = results[1] as List<Receita>;
    } catch (e) {
      _error.value = 'Erro ao carregar dados: $e';
    } finally {
      _isLoading.value = false;
    }
  }

  /// Marca/desmarca uma refeição como realizada
  void marcarRefeicao(int index) {
    if (index >= 0 && index < planoDia.length) {
      final refeicao = planoDia[index];
      planoDia[index] = refeicao.copyWith(realizado: !refeicao.realizado);
    }
  }

  /// Recarrega os dados
  Future<void> recarregar() async {
    await carregarDados();
  }
}
