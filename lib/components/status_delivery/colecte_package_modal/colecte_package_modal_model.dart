import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'colecte_package_modal_widget.dart' show ColectePackageModalWidget;
import 'package:flutter/material.dart';

class ColectePackageModalModel
    extends FlutterFlowModel<ColectePackageModalWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Checkbox widget.
  Map<StopRecord, bool> checkboxValueMap = {};
  List<StopRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // Stores action output result for [Firestore Query - Query a collection] action in SlideToConfirm widget.
  List<StopRecord>? listStopsInDelivery;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
