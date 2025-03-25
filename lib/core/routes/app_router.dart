import 'package:flutter/widgets.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  AppRouters.home.path: (context) => Container(),
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
