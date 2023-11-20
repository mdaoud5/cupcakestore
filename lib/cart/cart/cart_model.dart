import '/backend/backend.dart';
import '/components/cart_item/cart_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cart_widget.dart' show CartWidget;
import 'package:flutter/material.dart';

class CartModel extends FlutterFlowModel<CartWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Models for cartItem dynamic component.
  late FlutterFlowDynamicModels<CartItemModel> cartItemModels;
  // State field(s) for CUPOMTextField widget.
  FocusNode? cUPOMTextFieldFocusNode;
  TextEditingController? cUPOMTextFieldController;
  String? Function(BuildContext, String?)? cUPOMTextFieldControllerValidator;
  // State field(s) for PlacePicker widget.
  var placePickerValue = const FFPlace();
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  OrdersRecord? order;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    cartItemModels = FlutterFlowDynamicModels(() => CartItemModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    cartItemModels.dispose();
    cUPOMTextFieldFocusNode?.dispose();
    cUPOMTextFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
