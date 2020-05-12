import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:ideabuilder/app/locator.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/router.gr.dart';

void main() {
  setupLocator();
  runApp(DevicePreview(builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      initialRoute: Routes.startupViewRoute,
      onGenerateRoute: Router().onGenerateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}
