import 'package:dartz/dartz.dart';
import 'package:sample_firebase/core/error/failure.dart';
import 'package:sample_firebase/core/usecase/usecase.dart';
import 'package:sample_firebase/features/home/domain/repository/home_repository.dart';

class GetDummy2Data implements Usecase<Stream<List<Map<String, dynamic>>>,NoParam> {
  final HomeRepository repository;

  GetDummy2Data({required this.repository});
  
  @override
  Future<Either<Failure, Stream<List<Map<String, dynamic>>>>> call(NoParam param) {
 return repository.getDummy2();
  }
  
 
 
  
}