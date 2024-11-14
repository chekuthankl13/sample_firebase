import 'package:dartz/dartz.dart';
import 'package:sample_firebase/core/error/failure.dart';
import 'package:sample_firebase/features/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:sample_firebase/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});
  
  @override
  Future<Either<Failure, Stream<List<Map<String, dynamic>>>>> getDummy1() async{
    try {
      var res = remoteDataSource.getDummy1();
      return Right(res);
    }on Failure catch (e) {
      return Left(e);
    }
  }
  
  @override
  Future<Either<Failure, Stream<List<Map<String, dynamic>>>>> getDummy2()async {
    try {
      var res = remoteDataSource.getDummy2();
      return Right(res);
    }on Failure catch (e) {
      return Left(e);
    }
  }
  
  
  

  
  
}