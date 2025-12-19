import 'package:get/get.dart';
import '../../app/main_shell.dart';
import '../../modules/dieta/dieta_binding.dart';
import '../../modules/home/home_binding.dart';
import '../../modules/planner/planner_binding.dart';
import '../../modules/treino/treino_binding.dart';
import 'app_routes.dart';

/// Application pages configuration
class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => const MainShell(),
      bindings: [
        HomeBinding(),
        TreinoBinding(),
        DietaBinding(),
        PlannerBinding(),
      ],
    ),
  ];
}
