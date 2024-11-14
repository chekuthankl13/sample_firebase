import 'package:dartz/dartz.dart';
import 'package:sample_firebase/core/error/failure.dart';

abstract class HomeRepository {
  Future<Either<Failure, Stream<List<Map<String,dynamic>>>>> getDummy1();
  Future<Either<Failure, Stream<List<Map<String,dynamic>>>>> getDummy2();

}