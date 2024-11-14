import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String error;

  Failure({required this.error});
   @override
  List<Object> get props => [];
}

// General failures
class ServerFailure extends Failure {
  ServerFailure({required super.error});
}

class CacheFailure extends Failure {
  CacheFailure({required super.error});
}

class NetworkFailure extends Failure {
  NetworkFailure({required super.error});
}

class ExceptionFailure extends Failure {
  ExceptionFailure({required super.error});
}

class CredentialFailure extends Failure {
  CredentialFailure({required super.error});
}

class AuthenticationFailure extends Failure {
  AuthenticationFailure({required super.error});
}