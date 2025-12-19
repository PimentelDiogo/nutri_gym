import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/theme/app_colors.dart';
import '../modules/dieta/presentation/pages/dieta_page.dart';
import '../modules/home/presentation/pages/home_page.dart';
import '../modules/planner/presentation/pages/planner_page.dart';
import '../modules/treino/presentation/pages/treino_page.dart';

/// Controller para o shell principal com navegação
class MainShellController extends GetxController {
  final currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
  }
}

/// Shell principal com Bottom Navigation Bar
class MainShell extends StatelessWidget {
  const MainShell({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainShellController());

    final pages = [
      const HomePage(),
      const TreinoPage(),
      const DietaPage(),
      const PlannerPage(),
    ];

    return Obx(
      () => Scaffold(
        body: pages[controller.currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changePage,
          backgroundColor: AppColors.cardDark,
          selectedItemColor: AppColors.primaryBlue,
          unselectedItemColor: AppColors.textSilver,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center),
              label: 'Treino',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.restaurant),
              label: 'Dieta',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          ],
        ),
      ),
    );
  }
}
