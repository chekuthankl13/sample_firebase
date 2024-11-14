import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sample_firebase/core/error/failure.dart';

abstract class Usecase<Type,Params> {
 Future<Either<Failure,Type>> call(Params param);
}

abstract class Usecase2<Type,Params> {
 Stream<Either<Failure,Type>> call(Params param);
}

class NoParam extends Equatable {
  @override
  List<Object?> get props => [];
  
}