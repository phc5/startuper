import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:ideabuilder/app/locator.dart';
import 'package:ideabuilder/services/theme_manager.dart';
import 'package:provider/provider.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ideabuilder/ui/shared/theme.dart';
import 'app/router.gr.dart';

void main() {
  setupLocator();
  runApp(
    ChangeNotifierProvider<ThemeNotifier>(
      child: MyApp(),
      create: (_) => ThemeNotifier(darkTheme),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      title: 'Startuper',
      theme: themeNotifier.getTheme(),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.startupViewRoute,
      onGenerateRoute: Router().onGenerateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}
