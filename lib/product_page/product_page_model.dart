import '/flutter_flow/flutter_flow_util.dart';
import 'product_page_widget.dart' show ProductPageWidget;
import 'package:flutter/material.dart';

class ProductPageModel extends FlutterFlowModel<ProductPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for CountController widget.
  int? countControllerValue;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
