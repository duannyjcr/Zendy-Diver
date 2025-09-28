import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'details_map_widget.dart' show DetailsMapWidget;
import 'package:flutter/material.dart';

class DetailsMapModel extends FlutterFlowModel<DetailsMapWidget> {
  ///  State fields for stateful widgets in this page.

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
