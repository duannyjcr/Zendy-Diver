// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/widgets/index.dart';
import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

import '/flutter_flow/lat_lng.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gmaps;
import 'package:google_polyline_algorithm/google_polyline_algorithm.dart';

class PaintinRputeMapWidget extends StatefulWidget {
  const PaintinRputeMapWidget({
    super.key,
    this.width,
    this.height,
    required this.locations,
    required this.intensities,
    required this.routeGeometry,
    required this.hotMap,
  });

  final double? width;
  final double? height;
  final List<LatLng> locations;
  final List<int> intensities;
  final String routeGeometry;
  final bool hotMap;

  @override
  State<PaintinRputeMapWidget> createState() => _PaintinRputeMapWidgetState();
}

class _PaintinRputeMapWidgetState extends State<PaintinRputeMapWidget> {
  @override
  Widget build(BuildContext context) {
    // Convertir FlutterFlow LatLng a Google Maps LatLng
    final List<gmaps.LatLng> gmapsLocations = widget.locations!
        .map((loc) => gmaps.LatLng(loc.latitude, loc.longitude))
        .toList();

    // Crear círculos para simular el heatmap
    Set<gmaps.Circle> circles = {};
    for (int i = 0; i < gmapsLocations.length; i++) {
      circles.add(gmaps.Circle(
        circleId: gmaps.CircleId(i.toString()),
        center: gmapsLocations[i],
        radius: 400.0,
        fillColor: Colors.red.withOpacity(0.5),
        strokeColor: Colors.red.withOpacity(0.5),
        // fillColor: Colors.red.withOpacity(widget.intensities[i] / 100),
        // strokeColor: Colors.red.withOpacity(widget.intensities[i] / 100),
        strokeWidth: 1,
      ));
    }

    // Crear marcadores usando gmaps.*
    Set<gmaps.Marker> _crearMarcadores(List<gmaps.LatLng> paradas) {
      return paradas.map((parada) {
        return gmaps.Marker(
          markerId: gmaps.MarkerId(parada.toString()), // id único
          position: parada,
          icon: gmaps.BitmapDescriptor.defaultMarkerWithHue(
            gmaps.BitmapDescriptor.hueBlue,
          ),
          infoWindow: gmaps.InfoWindow(
            title: "Parada",
            snippet: "${parada.latitude}, ${parada.longitude}",
          ),
        );
      }).toSet();
    }

    // 👇 Decodificar polyline si viene del JSON
    Set<gmaps.Polyline> polylines = {};
    if (widget.routeGeometry != null && widget.routeGeometry!.isNotEmpty) {
      final decodedPoints = decodePolyline(widget.routeGeometry!);
      //final decodedPoints = decodePolyline(
      //    "hl`tEfy`vIjBzH`]sMz@jEeM|E{Ah@QrBqDQmOjF_E_QsEeJzEgBcAaEmCqLyDhBaB_IeDku@up@oW?_EcFyBuAA{BrCyEcByW{L~CqK~CxAk@pBi@nB{n@sYrEqRm@aTdLcTpRsSnI}NzRoTrN_HxN|C~GCpF}AhDqExCt@nAeCpW}H~FgPMgOjDC");
      final polylineCoords = decodedPoints
          .map((p) => gmaps.LatLng(p[0].toDouble(), p[1].toDouble())) // 👈 cast
          .toList();
      polylines.add(gmaps.Polyline(
        polylineId: const gmaps.PolylineId('route'),
        points: polylineCoords,
        color: Colors.black,
        width: 4,
      ));
    }
    if (widget.hotMap) {
      return Container(
        width: widget.width ?? double.infinity,
        height: widget.height ?? 300,
        child: gmaps.GoogleMap(
          initialCameraPosition: gmaps.CameraPosition(
            target: gmapsLocations.isNotEmpty
                ? gmapsLocations[0]
                : gmaps.LatLng(-34.905, -56.206),
            zoom: 12,
          ),
          circles: circles,
          myLocationEnabled: true,
          zoomControlsEnabled: true,
        ),
      );
    } else {
      return Container(
        width: widget.width ?? double.infinity,
        height: widget.height ?? 300,
        child: gmaps.GoogleMap(
          initialCameraPosition: gmaps.CameraPosition(
            target: gmapsLocations.isNotEmpty
                ? gmapsLocations[0]
                : gmaps.LatLng(-34.905, -56.206),
            zoom: 15,
          ),
          markers: _crearMarcadores(gmapsLocations),
          polylines: polylines, // 👈 ahora dibuja la ruta
          myLocationEnabled: true,
          zoomControlsEnabled: true,
        ),
      );
    }
  }
}
