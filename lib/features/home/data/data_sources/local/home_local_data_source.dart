import 'package:intl/intl.dart';
import 'package:sample_firebase/core/db/hive_helpers.dart';

abstract interface class HomeLocalDataSource {
  Stream<List<Map<String, dynamic>>>? getDummy1();
  Stream<List<Map<String, dynamic>>>? getDummy2();

  Future addDummy1(Stream<List<Map<String, dynamic>>> data);
  Future addDummy2(Stream<List<Map<String, dynamic>>> data);
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  final HiveHelpers helpers;

  HomeLocalDataSourceImpl({required this.helpers});
  @override
  addDummy1(Stream<List<Map<String, dynamic>>> data) async {
    return await helpers.cacheMainData1(data);
  }

  @override
  addDummy2(Stream<List<Map<String, dynamic>>> data) async {
    return await helpers.cacheMainData2(data);
  }

  @override
  Stream<List<Map<String, dynamic>>>? getDummy1() {
    var r = helpers.getmainData1();
    var time = helpers.getDummyTime();
    if (r == null) {
      return null;//const Stream<List<Map<String, dynamic>>>.empty();
    } else if (time != DateFormat('dd-MM-yyyy').format(DateTime.now())) {
      return null;//const Stream<List<Map<String, dynamic>>>.empty();
    } else {
      return r;
    }
  }

  @override
  Stream<List<Map<String, dynamic>>>? getDummy2() {
    var r = helpers.getmainData2();
    var time = helpers.getDummyTime2();

    if (r == null) {
      return null;//const Stream<List<Map<String, dynamic>>>.empty();
    } else if (time !=DateFormat('dd-MM-yyyy').format(DateTime.now())) {
      return null;//const Stream<List<Map<String, dynamic>>>.empty();
    } else {
      return r;
    }
  }
}
