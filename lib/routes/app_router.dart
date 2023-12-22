import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/screens/login_page.dart';
import 'package:flutter_application_1/screens/onboarding_screen.dart';
import 'package:flutter_application_1/screens/signup_page.dart';

class AppRouter {
  Route? ongenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/home":
        return MaterialPageRoute(
          builder: (_) => const Home(),
        );
      case "/onboarding":
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case "/login":
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );
      case "/signup":
        return MaterialPageRoute(
          builder: (_) => const SignUpPage(),
        );
      default:
        return null;
    }
  }
}
