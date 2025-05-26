import 'package:flutter/material.dart';

import 'shared/core/dependency_injection/inject.dart';
import 'shared/core/navigation/app_router.dart';

void main() {
  setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: router);
  }
}
