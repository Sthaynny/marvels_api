import 'dart:async';

import 'package:flutter/material.dart';
import 'package:marvels_api/core/dependecy/dependency.dart';
import 'package:marvels_api/core/utils/string/strings.dart';
import 'package:marvels_api/features/my_app.dart';

void main() {
  runZonedGuarded(
    () {
      setupDependency();
      runApp(const MyApp());
    },
    (error, stack) {
      debugPrint(erroDeInicializacaoString);
    },
  );
}
