import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'delivery_map_widget.dart' show DeliveryMapWidget;
import 'package:flutter/material.dart';

class DeliveryMapModel extends FlutterFlowModel<DeliveryMapWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();
  // Stores action output result for [Custom Action - isPointInPolygon] action in Button widget.
  bool? validLocation;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future centermap(
    BuildContext context, {
    LatLng? center,
  }) async {
    await centermap(context);
    await launchMap(
      location: center,
      title: '',
    );
  }
}
