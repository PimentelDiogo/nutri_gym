import 'package:get/get.dart';
import 'data/datasources/home_datasource.dart';
import 'data/repositories/home_repository_impl.dart';
import 'domain/repositories/i_home_repository.dart';
import 'domain/usecases/get_home_summary_usecase.dart';
import 'presentation/controllers/home_controller.dart';

/// Home module bindings for dependency injection
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // DataSource
    Get.lazyPut<HomeLocalDataSource>(() => HomeLocalDataSource());

    // Repository
    Get.lazyPut<IHomeRepository>(() => HomeRepositoryImpl(Get.find()));

    // UseCase
    Get.lazyPut<GetHomeSummaryUseCase>(() => GetHomeSummaryUseCase(Get.find()));

    // Controller
    Get.lazyPut<HomeController>(() => HomeController(Get.find()));
  }
}
