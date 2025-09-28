import '/backend/backend.dart';
import '/components/active_driver/active_driver_widget.dart';
import '/components/status_delivery/acept_route/acept_route_widget.dart';
import '/components/status_delivery/go_delivery/go_delivery_widget.dart';
import '/components/status_delivery/go_pickup/go_pickup_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in Home widget.
  DeliveryRecord? delivery;
  // Stores action output result for [Custom Action - getDeviceToken] action in Home widget.
  String? deviceToken;
  AudioPlayer? soundPlayer;
  // Model for AceptRoute component.
  late AceptRouteModel aceptRouteModel;
  // Model for goPickup component.
  late GoPickupModel goPickupModel;
  // Model for goDelivery component.
  late GoDeliveryModel goDeliveryModel;
  // Model for activeDriver component.
  late ActiveDriverModel activeDriverModel;

  @override
  void initState(BuildContext context) {
    aceptRouteModel = createModel(context, () => AceptRouteModel());
    goPickupModel = createModel(context, () => GoPickupModel());
    goDeliveryModel = createModel(context, () => GoDeliveryModel());
    activeDriverModel = createModel(context, () => ActiveDriverModel());
  }

  @override
  void dispose() {
    aceptRouteModel.dispose();
    goPickupModel.dispose();
    goDeliveryModel.dispose();
    activeDriverModel.dispose();
  }
}
