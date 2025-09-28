import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'details_map_route_widget.dart' show DetailsMapRouteWidget;
import 'package:flutter/material.dart';

class DetailsMapRouteModel extends FlutterFlowModel<DetailsMapRouteWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in DetailsMapRoute widget.
  List<StopRecord>? listStops;
  // Stores action output result for [Backend Call - Read Document] action in DetailsMapRoute widget.
  DeliveryRecord? deliveryDocument;
  // Stores action output result for [Custom Action - getListLocationLatLng] action in DetailsMapRoute widget.
  List<LatLng>? listMarket;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future centermap(
    BuildContext context, {
    LatLng? center,
  }) async {
    await launchMap(
      location: center,
      title: '',
    );
  }
}
