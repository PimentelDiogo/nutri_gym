import 'package:get/get.dart';
import '../../modules/home/home_binding.dart';
import '../../modules/home/presentation/pages/home_page.dart';
import '../../modules/treino/treino_binding.dart';
import '../../modules/treino/presentation/pages/treino_page.dart';
import '../../modules/dieta/dieta_binding.dart';
import '../../modules/dieta/presentation/pages/dieta_page.dart';
import '../../modules/planner/planner_binding.dart';
import '../../modules/planner/presentation/pages/planner_page.dart';
import 'app_routes.dart';

/// Application pages configuration
class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.treino,
      page: () => const TreinoPage(),
      binding: TreinoBinding(),
    ),
    GetPage(
      name: Routes.dieta,
      page: () => const DietaPage(),
      binding: DietaBinding(),
    ),
    GetPage(
      name: Routes.planner,
      page: () => const PlannerPage(),
      binding: PlannerBinding(),
    ),
  ];
}
