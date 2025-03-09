import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/core/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'core/navigation/routes.dart';
import 'core/utils/bloc_observer/bloc_observer_service.dart';
import 'core/utils/providers/user_session_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  Bloc.observer = getIt<BlocObserverService>();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      startLocale: const Locale('en'),
      child: MultiBlocProvider(
        providers: [
          ChangeNotifierProvider<UserSessionProvider>(
            create: (context) => getIt<UserSessionProvider>(),
          ),
        ],
        child: const OnlineExamApp(),
      ),
    ),
  );
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
            routes: AppRoutes.routes,
            theme: AppTheme.appTheme,
            initialRoute: AppRoutes.loginRoute,
          ),
        );
      },
    );
  }
}
