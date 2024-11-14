import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sample_firebase/core/error/exceptions.dart';
import 'package:sample_firebase/features/home/data/data_sources/local/home_local_data_source.dart';

abstract interface class HomeRemoteDataSource {
  Stream<List<Map<String, dynamic>>> getDummy1();
  Stream<List<Map<String, dynamic>>> getDummy2();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;
  final HomeLocalDataSource localDataSource;
  

  HomeRemoteDataSourceImpl( {required this.firebaseFirestore,required this.localDataSource});
  @override
  Stream<List<Map<String, dynamic>>> getDummy1() {
    try {

//       var res = localDataSource.getDummy1();
// log(res.toString(),name: "staream");
//       if (res == null ) {
//         log(" local cache is empty");

        var stream = firebaseFirestore
          .collection("dummy1")
          .snapshots()
          .map((querySnapshot) {
        return querySnapshot.docs.map((doc) {
          return doc.data();
        }).toList();
      });
      localDataSource.addDummy1(stream);
      
      return stream;
      // } else {
      //   log("from local cache");
      //  var k = localDataSource.getDummy1();
      //  return k!;
      // }


      
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Stream<List<Map<String, dynamic>>> getDummy2() {
    try {
      // var res = localDataSource.getDummy2();
      // if (res == null) {
        var stream = firebaseFirestore
          .collection("dummy2")
          .snapshots()
          .map((snap) => snap.docs.map((doc) => doc.data()).toList());
          localDataSource.addDummy2(stream); 
      return stream;
      // } else {
      //    var k = localDataSource.getDummy2();
      //  return k!;
      // }
    } catch (e) {
      throw ServerException();
    }
  }
}
