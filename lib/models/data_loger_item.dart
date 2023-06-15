import 'dart:convert';

class Dataloger {
  final int timestamp;
  final double humidityInside;
  final double humidityOutside;
  final double tempInside;
  final double tempOutside;
  final double radonLevel;
  final dynamic batteryStatus;
  final String lat;
  final String lon;

  Dataloger({
    required this.timestamp,
    required this.humidityInside,
    required this.humidityOutside,
    required this.tempInside,
    required this.tempOutside,
    required this.radonLevel,
    required this.batteryStatus,
    required this.lat,
    required this.lon,
  });

  factory Dataloger.fromJson(Map<String, dynamic> json) {
    return Dataloger(
      timestamp: json['timestamp'],
      humidityInside: json['humidity_inside'],
      humidityOutside: json['humidity_outside'],
      tempInside: json['temp_inside'],
      tempOutside: json['temp_outside'],
      radonLevel: json['radon_level'],
      batteryStatus: json['battery_status'],
      lat: json['lat'] ?? '',
      lon: json['lon'] ?? '',
    );
  }
}
