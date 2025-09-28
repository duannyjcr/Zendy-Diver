// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
bool isPointInPolygon(LatLng point) {
  List<LatLng> polygon = [
    LatLng(-34.874910, -56.211967),
    LatLng(-34.872217, -56.202120),
    LatLng(-34.869776, -56.167094),
    LatLng(-34.868027, -56.162704),
    LatLng(-34.886564, -56.137860), //Avnida italia
    LatLng(-34.904284, -56.116503),
    LatLng(-34.939488, -56.159888),
    LatLng(-34.911346, -56.231891),
    LatLng(-34.874910, -56.211967)
  ];

  int intersectCount = 0;
  for (int j = 0; j < polygon.length - 1; j++) {
    if (_rayCastIntersect(point, polygon[j], polygon[j + 1])) {
      intersectCount++;
    }
  }
  return (intersectCount % 2) == 1;
}

bool _rayCastIntersect(LatLng point, LatLng vertA, LatLng vertB) {
  if ((vertA.longitude > point.longitude) !=
      (vertB.longitude > point.longitude)) {
    double atX = (vertB.latitude - vertA.latitude) *
            (point.longitude - vertA.longitude) /
            (vertB.longitude - vertA.longitude) +
        vertA.latitude;
    if (point.latitude < atX) {
      return true;
    }
  }
  return false;
}
