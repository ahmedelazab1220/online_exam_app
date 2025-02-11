import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:online_exam_app/core/theme/app_theme.dart';
import 'core/navigation/navigation_manager.dart';
import 'core/navigation/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: const [
      Locale('ar'),
      Locale('en'),
    ],
    path: 'assets/translations',
    fallbackLocale: const Locale('en'),
    startLocale: const Locale('en'),
    child: const OnlineExamApp(),
  ));
}

class OnlineExamApp extends StatelessWidget {
  const OnlineExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SafeArea(
          child: MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            navigatorKey: NavigationManager.navigationKey,
            routes: AppRoutes.routes,
            theme: AppTheme.appTheme,
            initialRoute: AppRoutes.loginRoute,
          ),
        );
      },
    );
  }
}
