import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'deltails_delivery_widget.dart' show DeltailsDeliveryWidget;
import 'package:flutter/material.dart';

class DeltailsDeliveryModel extends FlutterFlowModel<DeltailsDeliveryWidget> {
  ///  Local state fields for this page.

  List<StopStruct> stops = [];
  void addToStops(StopStruct item) => stops.add(item);
  void removeFromStops(StopStruct item) => stops.remove(item);
  void removeAtIndexFromStops(int index) => stops.removeAt(index);
  void insertAtIndexInStops(int index, StopStruct item) =>
      stops.insert(index, item);
  void updateStopsAtIndex(int index, Function(StopStruct) updateFn) =>
      stops[index] = updateFn(stops[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
