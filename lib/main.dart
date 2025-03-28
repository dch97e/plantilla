import 'package:flutter/material.dart';

import 'src/core/core.dart';
import 'src/shared/shared.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppModules().setup(); // Setup dependency injection

  Log.showDate = true;
  Log.truncate = true;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter MVVM',
      theme: AppStyles.appTheme,
      darkTheme: AppStyles.appDarkTheme,
      themeMode: ThemeMode.system, // Enable automatic dark theme support
      routerConfig: router,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            // Remove focus when touching outside a focused area
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: child,
        );
      },
      onGenerateTitle: (context) {
        LocalizationManager.init(context: context);
        return localizations.app_title;
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
