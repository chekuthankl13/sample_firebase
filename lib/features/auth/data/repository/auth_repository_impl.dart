import 'package:dartz/dartz.dart';
import 'package:sample_firebase/core/error/failure.dart';
import 'package:sample_firebase/features/auth/data/data_source/auth_remote_datasorce.dart';
import 'package:sample_firebase/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasorce remoteDatasorce;

  AuthRepositoryImpl({required this.remoteDatasorce});
  @override
  Future<Either<Failure, String>> login({email, password})async {
    try {
      var res = await remoteDatasorce.login(email: email,password: password);
      return Right(res);
    }on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, String>> register({email, password})async {
    try {
      var res = await remoteDatasorce.register(email: email,password: password);
      return Right(res);
    }on Failure catch (e) {
      return Left(e);
    }
  }
  
}