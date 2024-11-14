import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sample_firebase/bloc_observer.dart';
import 'package:sample_firebase/core/theme/app_theme.dart';
import 'package:sample_firebase/core/utils/utils.dart';
import 'package:sample_firebase/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:sample_firebase/features/auth/presentation/cubit/obscure_cubit.dart';
import 'package:sample_firebase/features/home/presentation/cubit/home_cubit.dart';
import 'package:sample_firebase/features/splash/splash_screen.dart';
import 'package:sample_firebase/firebase_options.dart';

import 'core/services/service_locator.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();


  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  await Hive.openBox("time_dummy");
  await Hive.openBox("time_dummy2");
  await Hive.openBox("cache_main1");
  await Hive.openBox("cache_main2");


 init();

 Bloc.observer = MyBlocObserver();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<ObscureCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<AuthCubit>(),
        ),
         BlocProvider(
          create: (context) => sl<HomeCubit>(),
        ),
      ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
     theme: AppTheme.theme,
     home: const SplashScreen(),
    ),
    );
  }
}
