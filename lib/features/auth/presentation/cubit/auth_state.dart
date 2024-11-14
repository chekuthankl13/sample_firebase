part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthError extends AuthState {
  final Failure error;

  const AuthError({required this.error});
  @override
  List<Object> get props => [error];
}

final class AuthLogin extends AuthState {}

final class AuthRegister extends AuthState {}

