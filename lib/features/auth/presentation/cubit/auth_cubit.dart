import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_firebase/core/error/failure.dart';
import 'package:sample_firebase/features/auth/domain/entity/auth_params.dart';
import 'package:sample_firebase/features/auth/domain/usecases/login_usecase.dart';
import 'package:sample_firebase/features/auth/domain/usecases/register_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUsecase loginUsecase;
  final RegisterUsecase registerUsecase;
  AuthCubit(this.loginUsecase, this.registerUsecase) : super(AuthInitial());

  login({email,password})async{
    try {
      emit(AuthLoading());
      var res = await loginUsecase.call(AuthParams(email: email, password: password));
      res.fold((l)=>emit(AuthError(error: l)), (r)=>emit(AuthLogin()));
    } catch (e) {
      emit(AuthError(error:ExceptionFailure(error: e.toString()) ));
    }
  }


  register({email,password})async{
    try {
      emit(AuthLoading());
      var res = await registerUsecase.call(AuthParams(email: email, password: password));
      res.fold((l)=>emit(AuthError(error: l)), (r)=>emit(AuthRegister()));
    }on Failure catch (e) {
      emit(AuthError(error:ExceptionFailure(error: e.toString()) ));
      
    }
  }

}
