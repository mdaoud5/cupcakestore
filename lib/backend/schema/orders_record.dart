import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "order_Status" field.
  String? _orderStatus;
  String get orderStatus => _orderStatus ?? '';
  bool hasOrderStatus() => _orderStatus != null;

  // "order_created_time" field.
  DateTime? _orderCreatedTime;
  DateTime? get orderCreatedTime => _orderCreatedTime;
  bool hasOrderCreatedTime() => _orderCreatedTime != null;

  // "order_value" field.
  double? _orderValue;
  double get orderValue => _orderValue ?? 0.0;
  bool hasOrderValue() => _orderValue != null;

  // "order_number" field.
  int? _orderNumber;
  int get orderNumber => _orderNumber ?? 0;
  bool hasOrderNumber() => _orderNumber != null;

  // "order_items" field.
  List<CartItemTypeStruct>? _orderItems;
  List<CartItemTypeStruct> get orderItems => _orderItems ?? const [];
  bool hasOrderItems() => _orderItems != null;

  // "delivery_adress" field.
  String? _deliveryAdress;
  String get deliveryAdress => _deliveryAdress ?? '';
  bool hasDeliveryAdress() => _deliveryAdress != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _orderStatus = snapshotData['order_Status'] as String?;
    _orderCreatedTime = snapshotData['order_created_time'] as DateTime?;
    _orderValue = castToType<double>(snapshotData['order_value']);
    _orderNumber = castToType<int>(snapshotData['order_number']);
    _orderItems = getStructList(
      snapshotData['order_items'],
      CartItemTypeStruct.fromMap,
    );
    _deliveryAdress = snapshotData['delivery_adress'] as String?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Orders')
          : FirebaseFirestore.instance.collectionGroup('Orders');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Orders').doc();

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  String? orderStatus,
  DateTime? orderCreatedTime,
  double? orderValue,
  int? orderNumber,
  String? deliveryAdress,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'order_Status': orderStatus,
      'order_created_time': orderCreatedTime,
      'order_value': orderValue,
      'order_number': orderNumber,
      'delivery_adress': deliveryAdress,
      'user_ref': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.orderStatus == e2?.orderStatus &&
        e1?.orderCreatedTime == e2?.orderCreatedTime &&
        e1?.orderValue == e2?.orderValue &&
        e1?.orderNumber == e2?.orderNumber &&
        listEquality.equals(e1?.orderItems, e2?.orderItems) &&
        e1?.deliveryAdress == e2?.deliveryAdress &&
        e1?.userRef == e2?.userRef;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
        e?.orderStatus,
        e?.orderCreatedTime,
        e?.orderValue,
        e?.orderNumber,
        e?.orderItems,
        e?.deliveryAdress,
        e?.userRef
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
