import 'package:flutter/material.dart';
import 'package:web_login_flutter/pages/home/home_page.dart';
import 'package:web_login_flutter/pages/join/join_page.dart';
import 'package:web_login_flutter/pages/login/login_page.dart';
import 'package:web_login_flutter/pages/profile/profile_page.dart';

class RouteGenerator {
  static const String loginPage = '/';
  static const String joinPage = '/join';
  static const String homePage = '/home';
  static const String profilePage = '/page';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginPage:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );
      case joinPage:
      return MaterialPageRoute(
        builder: (_) => const JoinPage(),
      );
      case homePage:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case profilePage:
        return MaterialPageRoute(
          builder: (_) => const ProfilePage(),
        );
      default:
        throw const FormatException("Route not found");
    }
  }

}
