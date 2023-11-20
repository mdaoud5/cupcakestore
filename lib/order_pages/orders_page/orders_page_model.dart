import '/components/order_comp/order_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'orders_page_widget.dart' show OrdersPageWidget;
import 'package:flutter/material.dart';

class OrdersPageModel extends FlutterFlowModel<OrdersPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Models for orderComp dynamic component.
  late FlutterFlowDynamicModels<OrderCompModel> orderCompModels1;
  // Models for orderComp dynamic component.
  late FlutterFlowDynamicModels<OrderCompModel> orderCompModels2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    orderCompModels1 = FlutterFlowDynamicModels(() => OrderCompModel());
    orderCompModels2 = FlutterFlowDynamicModels(() => OrderCompModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    orderCompModels1.dispose();
    orderCompModels2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
