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

List<LatLng> getListLocationLatLng(
  LatLng deliveryLocation,
  List<StopRecord> listStops,
) {
  List<LatLng> locatList = [deliveryLocation];

  for (var stop in listStops) {
    // if(stop.location)
    locatList.add(stop.location!);
  }
  print(
      'esta es la lisata mas la direccion del negocio+++++++++++++++++++$locatList');
  return locatList;
}
