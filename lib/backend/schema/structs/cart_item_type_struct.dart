// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartItemTypeStruct extends FFFirebaseStruct {
  CartItemTypeStruct({
    DocumentReference? cartItem,
    int? quantity,
    double? valorTotal,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _cartItem = cartItem,
        _quantity = quantity,
        _valorTotal = valorTotal,
        super(firestoreUtilData);

  // "cartItem" field.
  DocumentReference? _cartItem;
  DocumentReference? get cartItem => _cartItem;
  set cartItem(DocumentReference? val) => _cartItem = val;
  bool hasCartItem() => _cartItem != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;
  void incrementQuantity(int amount) => _quantity = quantity + amount;
  bool hasQuantity() => _quantity != null;

  // "valorTotal" field.
  double? _valorTotal;
  double get valorTotal => _valorTotal ?? 0.0;
  set valorTotal(double? val) => _valorTotal = val;
  void incrementValorTotal(double amount) => _valorTotal = valorTotal + amount;
  bool hasValorTotal() => _valorTotal != null;

  static CartItemTypeStruct fromMap(Map<String, dynamic> data) =>
      CartItemTypeStruct(
        cartItem: data['cartItem'] as DocumentReference?,
        quantity: castToType<int>(data['quantity']),
        valorTotal: castToType<double>(data['valorTotal']),
      );

  static CartItemTypeStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? CartItemTypeStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'cartItem': _cartItem,
        'quantity': _quantity,
        'valorTotal': _valorTotal,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'cartItem': serializeParam(
          _cartItem,
          ParamType.DocumentReference,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
        'valorTotal': serializeParam(
          _valorTotal,
          ParamType.double,
        ),
      }.withoutNulls;

  static CartItemTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      CartItemTypeStruct(
        cartItem: deserializeParam(
          data['cartItem'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['products'],
        ),
        quantity: deserializeParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
        valorTotal: deserializeParam(
          data['valorTotal'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'CartItemTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CartItemTypeStruct &&
        cartItem == other.cartItem &&
        quantity == other.quantity &&
        valorTotal == other.valorTotal;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([cartItem, quantity, valorTotal]);
}

CartItemTypeStruct createCartItemTypeStruct({
  DocumentReference? cartItem,
  int? quantity,
  double? valorTotal,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CartItemTypeStruct(
      cartItem: cartItem,
      quantity: quantity,
      valorTotal: valorTotal,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CartItemTypeStruct? updateCartItemTypeStruct(
  CartItemTypeStruct? cartItemType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cartItemType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCartItemTypeStructData(
  Map<String, dynamic> firestoreData,
  CartItemTypeStruct? cartItemType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cartItemType == null) {
    return;
  }
  if (cartItemType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && cartItemType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cartItemTypeData =
      getCartItemTypeFirestoreData(cartItemType, forFieldValue);
  final nestedData =
      cartItemTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = cartItemType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCartItemTypeFirestoreData(
  CartItemTypeStruct? cartItemType, [
  bool forFieldValue = false,
]) {
  if (cartItemType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cartItemType.toMap());

  // Add any Firestore field values
  cartItemType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCartItemTypeListFirestoreData(
  List<CartItemTypeStruct>? cartItemTypes,
) =>
    cartItemTypes?.map((e) => getCartItemTypeFirestoreData(e, true)).toList() ??
    [];
