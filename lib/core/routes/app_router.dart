import 'package:flutter/widgets.dart';
import 'package:marvels_api/core/dependecy/dependency.dart';
import 'package:marvels_api/features/home/view/home_screen.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  AppRouters.home.path: (context) => HomeScreen(viewModel: dependency()),
  AppRouters.detailsPerson.path: (context) {
    return Container();
  },
};

enum AppRouters {
  home,
  detailsPerson;

  const AppRouters();
  String get path => this == home ? '/' : '/$name';
}
