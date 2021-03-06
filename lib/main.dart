import 'package:flutter/material.dart';
import 'package:soc/app/app.locator.dart';
import 'package:soc/app/app.router.dart';
import 'package:soc/app/register_compact_ui.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  setupLocator();
  registCompactUI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(fontFamily: "Poppins"),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
