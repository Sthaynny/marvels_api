import 'package:flutter/material.dart';
import 'package:marvels_api/core/routes/app_router.dart';
import 'package:marvels_api/core/utils/string/strings.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: nomeAppString,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: routes,
    );
  }
}
