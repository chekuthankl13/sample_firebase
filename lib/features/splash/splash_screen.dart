import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sample_firebase/core/services/service_locator.dart';
import 'package:sample_firebase/core/utils/utils.dart';
import 'package:sample_firebase/features/auth/presentation/views/login_screen.dart';
import 'package:sample_firebase/features/home/presentation/views/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


@override
  void initState() {
   sl<FirebaseAuth>().userChanges().listen((user){
    if (user == null) {
      log("user is signed out");
      // navigatorKey.currentState!.pushReplacementNamed(AppRouter.login);
      navigatorKey.currentState!.pushReplacement(MaterialPageRoute(builder: (_)=>const LoginScreen()));
    } else {
      log("user is logged in");
      navigatorKey.currentState!.pushReplacement(MaterialPageRoute(builder: (_)=>const HomeScreen()));

    }
   });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading(),
    );
  }
}
