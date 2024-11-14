import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:sample_firebase/core/db/hive_helpers.dart';
import 'package:sample_firebase/features/auth/data/data_source/auth_remote_datasorce.dart';
import 'package:sample_firebase/features/auth/data/repository/auth_repository_impl.dart';
import 'package:sample_firebase/features/auth/domain/repository/auth_repository.dart';
import 'package:sample_firebase/features/auth/domain/usecases/login_usecase.dart';
import 'package:sample_firebase/features/auth/domain/usecases/register_usecase.dart';
import 'package:sample_firebase/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:sample_firebase/features/auth/presentation/cubit/obscure_cubit.dart';
import 'package:sample_firebase/features/home/data/data_sources/local/home_local_data_source.dart';
import 'package:sample_firebase/features/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:sample_firebase/features/home/data/repository/home_repository_impl.dart';
import 'package:sample_firebase/features/home/domain/repository/home_repository.dart';
import 'package:sample_firebase/features/home/domain/usecases/get_dummy1_data.dart';
import 'package:sample_firebase/features/home/domain/usecases/get_dummy2_data.dart';
import 'package:sample_firebase/features/home/presentation/cubit/home_cubit.dart';

var sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => AuthCubit(sl(), sl()));

  sl.registerLazySingleton(() => LoginUsecase(repo: sl()));
  sl.registerLazySingleton(() => RegisterUsecase(repo: sl()));

  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(remoteDatasorce: sl()));
  sl.registerLazySingleton<AuthRemoteDatasorce>(
      () => AuthRemoteDatasorceImpl(auth: sl()));

  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  sl.registerFactory(() => ObscureCubit());

  sl.registerFactory(() => HomeCubit(sl(), sl()));
  sl.registerLazySingleton(() => GetDummy1Data(repository: sl()));
  sl.registerLazySingleton(() => GetDummy2Data(repository: sl()));
  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(remoteDataSource: sl()));

  sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(firebaseFirestore: sl(),localDataSource: sl()));
      sl.registerLazySingleton<HomeLocalDataSource>(()=>HomeLocalDataSourceImpl(helpers: sl()));

sl.registerLazySingleton(()=>HiveHelpers());

  sl.registerLazySingleton(() => FirebaseFirestore.instance);

  
}
