import '/components/my_order_item/my_order_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'my_order_widget.dart' show MyOrderWidget;
import 'package:flutter/material.dart';

class MyOrderModel extends FlutterFlowModel<MyOrderWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Models for MyOrderItem dynamic component.
  late FlutterFlowDynamicModels<MyOrderItemModel> myOrderItemModels2;

  @override
  void initState(BuildContext context) {
    myOrderItemModels2 = FlutterFlowDynamicModels(() => MyOrderItemModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    myOrderItemModels2.dispose();
  }
}
