import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'go_delivery_widget.dart' show GoDeliveryWidget;
import 'package:flutter/material.dart';

class GoDeliveryModel extends FlutterFlowModel<GoDeliveryWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in goDelivery widget.
  StopRecord? stopDetails;
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeFocusNode?.dispose();
    pinCodeController?.dispose();
  }
}
