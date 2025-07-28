import 'package:flutter/material.dart';
import 'package:lunar_transfer/app/app.bottomsheets.dart';
import 'package:lunar_transfer/app/app.dialogs.dart';
import 'package:lunar_transfer/app/app.locator.dart';
import 'package:lunar_transfer/app/app.router.dart';
import 'package:lunar_transfer/app/app.theme.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();

  /// Initialize the theme manager
  await ThemeManager.initialise();

  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

final appTheme = LunarTheme();

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      // Always stay on light mode
      lightTheme: appTheme.generate(Brightness.light),
      darkTheme: appTheme.generate(Brightness.light),
      builder: (context, lightTheme, darkTheme, themeMode) {
        return MaterialApp(
          initialRoute: Routes.all.first,
          onGenerateRoute: StackedRouter().onGenerateRoute,
          navigatorKey: StackedService.navigatorKey,
          navigatorObservers: [StackedService.routeObserver],
          themeMode: themeMode,
          theme: lightTheme,
          darkTheme: darkTheme,
        );
      },
    );
  }
}
