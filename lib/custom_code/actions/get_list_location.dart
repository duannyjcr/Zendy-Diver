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

import 'dart:math' as math;

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

String getListLocation(
  LatLng deliveryLocation,
  List<StopRecord> listStops,
) {
  String locatList = "";
  locatList = '${deliveryLocation.longitude},${deliveryLocation.latitude}';
  if (listStops != null) {
    double higher = 0;
    int index = 0;
    for (int i = 0; i < listStops.length - 1; i++) {
      double distance =
          CalculateDistance(deliveryLocation, listStops[i].location!);
      if (distance >= higher) {
        higher = distance;
        index = i;
      }
    }
    var item = listStops.removeAt(index);
    for (var stop in listStops) {
      locatList = locatList +
          ';' +
          '${stop.location!.longitude},${stop.location!.latitude}';
    }
    print(
        'el mas lejano esta en la pocicion........................... $index');
    locatList = locatList +
        ';' +
        '${item.location!.longitude},${item.location!.latitude}';
  }
  print(locatList);
  return locatList;
}

double CalculateDistance(
  LatLng place1,
  LatLng place2,
) {
  double degreesToRadians(double degrees) {
    return degrees * (math.pi / 180);
  }

  final latLng1 = place1;
  final latLng2 = place2;
  var earthRadiusKm = 6371.0; // Raio da Terra em quilômetros
  var dLat = degreesToRadians(latLng2.latitude! - latLng1.latitude!);
  var dLng = degreesToRadians(latLng2.longitude! - latLng1.longitude!);
  var a = math.sin(dLat / 2) * math.sin(dLat / 2) +
      math.cos(degreesToRadians(latLng1.latitude!)) *
          math.cos(degreesToRadians(latLng2.latitude!)) *
          math.sin(dLng / 2) *
          math.sin(dLng / 2);
  var c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
  var distance = earthRadiusKm * c;
  return distance;
}
