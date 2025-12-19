import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/theme/app_theme.dart';
import 'initial_binding.dart';
import '../core/routes/app_pages.dart';
import '../core/routes/app_routes.dart';

/// Root widget of the application
class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'NutriGym',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      initialBinding: InitialBinding(),
      initialRoute: Routes.home,
      getPages: AppPages.routes,
    );
  }
}
