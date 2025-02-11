import 'package:flutter/material.dart';
import 'package:online_exam_app/core/theme/app_theme.dart';

import 'core/navigation/navigation_manager.dart';
import 'core/navigation/routes.dart';

void main() {
  runApp(const OnlineExamApp());
}

class OnlineExamApp extends StatelessWidget {
  const OnlineExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SafeArea(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: NavigationManager.navigationKey,
            routes: AppRoutes.routes,
            theme: AppTheme.appTheme,
            initialRoute: AppRoutes.forgetPasswordRoute,
          ),
        );
      },
    );
  }
}
