import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:soil_health_monitoring_app/Model/soil_data.dart';

class ReadingProvider extends ChangeNotifier {
  SoilData? _reading;
  SoilData? get reading => _reading;
  List<SoilData> _allReadings = [];
  List<SoilData> get allReadings => _allReadings;

  List<SoilData> _latestReadings = [];
  List<SoilData> get latestReadings => _latestReadings;

  final userId = FirebaseAuth.instance.currentUser?.uid;

  Future<void> testNewReading() async {
    final random = Random();
    double temperature = 20 + random.nextDouble();
    double moisture = 20 + random.nextDouble();
    DateTime dateTime = DateTime.now();
    SoilData newData = SoilData(
      timestamp: dateTime,
      moisture: moisture,
      temperature: temperature,
    );
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection('soil_data')
        .add(newData.toJson());
    _reading = newData;
    _latestReadings = [];
    notifyListeners();
  }

  Future<void> reportLastReading(int count) async {
    final snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection('soil_data')
        .orderBy('timestamp', descending: true)
        .limit(count)
        .get();
    //print("Document : ${snapshot.docs.length}");
    _latestReadings = snapshot.docs
        .map((doc) => SoilData.fromJson(doc.data()))
        .toList();

    _reading = null;
    notifyListeners();
  }

  Future<void> allReadingsForChart() async {
    final snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection('soil_data')
        .orderBy('timestamp')
        .get();

    _allReadings = snapshot.docs
        .map((doc) => SoilData.fromJson(doc.data()))
        .toList();

    notifyListeners();
  }
}
