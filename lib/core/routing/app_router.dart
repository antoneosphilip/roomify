import 'package:flutter/material.dart';
import 'package:rommify_app/core/routing/routes.dart';
import 'package:rommify_app/features/sign_up/ui/sign_up_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    // final arguments = settings.arguments as Map<String, dynamic>?;

    switch (settings.name) {
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );

      default:
        return null;
    }
  }
}
