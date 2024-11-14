
import 'package:flutter/material.dart';
import 'package:sample_firebase/core/error/exceptions.dart';
import 'package:sample_firebase/features/auth/presentation/views/login_screen.dart';
import 'package:sample_firebase/features/splash/splash_screen.dart';

class AppRouter {
  static const String splash = "/splash";
  static const String login = "/login";
  static const String register = "/register";

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings){
    switch (routeSettings.name.toString()) {
      case splash:
        return MaterialPageRoute(builder: (_)=> const SplashScreen());
      case login:
        return MaterialPageRoute(builder: (_)=>const  LoginScreen());
      default:
      throw const RouteException("Route not found !!");
    }
  }
}
