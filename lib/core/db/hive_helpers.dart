import 'dart:async';
import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class HiveHelpers {
  // Future<void> initHive() async {
  //   await Hive.initFlutter();

  // }

  Future cacheMainData1(Stream<List<Map<String, dynamic>>> data) async {
    var  _cacheBox = await Hive.openBox('cache_main1');
       List<Map<String, dynamic>> cachedData = await data.first;

    await _cacheBox.put("data", cachedData);
  }

  Future cacheMainData2(Stream<List<Map<String, dynamic>>> data) async {
    var  _cacheBox = await Hive.openBox('cache_main2');
    List<Map<String, dynamic>> cachedData = await data.first;
    await _cacheBox.put("data",cachedData);
  }

  Future savedummyTime() async {
    await Hive.box("time_dummy").put(
        "time", DateFormat('dd-MM-yyyy').format(DateTime.now()).toString());
  }

  String getDummyTime() {
    return Hive.box("time_dummy").get("time") ?? "";
  }

  Future savedummyTime2() async {
    await Hive.box("time_dummy2").put(
        "time", DateFormat('dd-MM-yyyy').format(DateTime.now()).toString());
  }

  String getDummyTime2() {
    return Hive.box("time_dummy2").get("time") ?? "";
  }

  Stream<List<Map<String, dynamic>>>? getmainData1() {
    var cachedData = Hive.box("cache_main1").get("data");

     if (cachedData != null) {
    // Create a StreamController to emit the cached data as a stream
    final controller = StreamController<List<Map<String, dynamic>>>.broadcast();
    controller.add(cachedData);  // Add the cached data to the stream
    return controller.stream;    // Return the stream
  }

  return null;
  }

  Stream<List<Map<String, dynamic>>>? getmainData2() {
    var cachedData = Hive.box("cache_main2").get("data");

    if (cachedData != null) {
    // Create a StreamController to emit the cached data as a stream
    final controller = StreamController<List<Map<String, dynamic>>>.broadcast();
    controller.add(cachedData);  // Add the cached data to the stream
    return controller.stream;    // Return the stream
  }

  return null;
  }

  clearBox() async {
    await Hive.box("cache_main1").clear();
    await Hive.box("cache_main2").clear();
  }
}
