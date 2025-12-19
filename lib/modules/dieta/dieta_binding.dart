import 'package:get/get.dart';
import 'data/datasources/dieta_datasource.dart';
import 'data/repositories/dieta_repository_impl.dart';
import 'domain/repositories/i_dieta_repository.dart';
import 'domain/usecases/get_plano_nutricional_usecase.dart';
import 'domain/usecases/get_receitas_sugeridas_usecase.dart';
import 'presentation/controllers/dieta_controller.dart';

/// Dieta module bindings for dependency injection
class DietaBinding extends Bindings {
  @override
  void dependencies() {
    // DataSource
    Get.lazyPut<DietaLocalDataSource>(() => DietaLocalDataSource());

    // Repository
    Get.lazyPut<IDietaRepository>(() => DietaRepositoryImpl(Get.find()));

    // UseCases
    Get.lazyPut<GetPlanoNutricionalUseCase>(
      () => GetPlanoNutricionalUseCase(Get.find()),
    );

    Get.lazyPut<GetReceitasSugeridasUseCase>(
      () => GetReceitasSugeridasUseCase(Get.find()),
    );

    // Controller
    Get.lazyPut<DietaController>(
      () => DietaController(
        getPlanoNutricionalUseCase: Get.find(),
        getReceitasSugeridasUseCase: Get.find(),
      ),
    );
  }
}
