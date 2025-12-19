import 'package:get/get.dart';
import '../../core/network/http_client.dart';
import 'data/datasources/home_datasource.dart';
import 'data/repositories/home_repository_impl.dart';
import 'domain/repositories/i_home_repository.dart';
import 'domain/usecases/get_home_summary_usecase.dart';
import 'presentation/controllers/home_controller.dart';

/// Home module bindings for dependency injection
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // HTTP Client (singleton global)
    Get.lazyPut<HttpClient>(() => HttpClient(), fenix: true);

    // DataSource
    Get.lazyPut<HomeLocalDataSource>(
      () => HomeLocalDataSource(Get.find<HttpClient>()),
    );

    // Repository
    Get.lazyPut<IHomeRepository>(() => HomeRepositoryImpl(Get.find()));

    // UseCase
    Get.lazyPut<GetHomeSummaryUseCase>(() => GetHomeSummaryUseCase(Get.find()));

    // Controller
    Get.lazyPut<HomeController>(() => HomeController(Get.find()));
  }
}
