import 'package:dartz/dartz.dart';
import 'package:sample_firebase/core/error/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure,String>> login({email,password});

  Future<Either<Failure,String>> register({email,password});

}