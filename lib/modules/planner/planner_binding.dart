import 'package:get/get.dart';
import 'presentation/controllers/planner_controller.dart';

/// Planner module bindings for dependency injection
class PlannerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlannerController>(() => PlannerController());
  }
}
