// To parse this JSON data, do
//
//     final soilData = soilDataFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

SoilData soilDataFromJson(String str) => SoilData.fromJson(json.decode(str));

String soilDataToJson(SoilData data) => json.encode(data.toJson());

class SoilData {
  final DateTime timestamp;
  final double moisture;
  final double temperature;

  SoilData({
    required this.timestamp,
    required this.moisture,
    required this.temperature,
  });

  factory SoilData.fromJson(Map<String, dynamic> json) => SoilData(
    timestamp:(json["timestamp"] as Timestamp).toDate(),
    moisture: (json["moisture"] as num).toDouble(),
    temperature: (json["temperature"] as num).toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "timestamp": Timestamp.fromDate(timestamp),
    "moisture": moisture,
    "temperature": temperature,
  };
}
