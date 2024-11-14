import 'package:dartz/dartz.dart';
import 'package:sample_firebase/core/error/failure.dart';
import 'package:sample_firebase/core/usecase/usecase.dart';
import 'package:sample_firebase/features/auth/domain/entity/auth_params.dart';
import 'package:sample_firebase/features/auth/domain/repository/auth_repository.dart';

class RegisterUsecase implements Usecase<String,AuthParams> {
  final AuthRepository repo;

  RegisterUsecase({required this.repo});
  @override
  Future<Either<Failure, String>> call(AuthParams param)async {
    return await repo.register(email: param.email,password: param.password);
  }
  
}