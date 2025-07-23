import 'package:basic_restaurant/core/utils/router/app_router.dart';
import 'package:flutter/material.dart';

class BasicRestrauntApp extends StatelessWidget {
  const BasicRestrauntApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
