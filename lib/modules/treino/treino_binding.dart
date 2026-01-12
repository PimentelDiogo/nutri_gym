import 'package:get/get.dart';
import 'data/datasources/treino_datasource.dart';
import 'data/repositories/treino_repository_impl.dart';
import 'domain/repositories/i_treino_repository.dart';
import 'domain/usecases/get_treino_do_dia_usecase.dart';
import 'domain/usecases/get_treino_semanal_usecase.dart';
import 'presentation/controllers/treino_controller.dart';

/// Treino module bindings for dependency injection
class TreinoBinding extends Bindings {
  @override
  void dependencies() {
    // DataSource
    Get.lazyPut<TreinoLocalDataSource>(() => TreinoLocalDataSource());

    // Repository
    Get.lazyPut<ITreinoRepository>(
      () => TreinoRepositoryImpl(Get.find<TreinoLocalDataSource>()),
    );

    // Use Cases
    Get.lazyPut<GetTreinoDoDiaUseCase>(
      () => GetTreinoDoDiaUseCase(Get.find<ITreinoRepository>()),
    );

    Get.lazyPut<GetTreinoSemanalUseCase>(
      () => GetTreinoSemanalUseCase(Get.find<ITreinoRepository>()),
    );

    // Controller
    Get.lazyPut<TreinoController>(
      () => TreinoController(
        getTreinoDoDiaUseCase: Get.find<GetTreinoDoDiaUseCase>(),
        getTreinoSemanalUseCase: Get.find<GetTreinoSemanalUseCase>(),
      ),
      fenix: true, // Mantém o controller entre navegações
    );
  }
}
