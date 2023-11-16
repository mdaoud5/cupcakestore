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

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _orderStatus = snapshotData['order_Status'] as String?;
    _orderCreatedTime = snapshotData['order_created_time'] as DateTime?;
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
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'order_Status': orderStatus,
      'order_created_time': orderCreatedTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    return e1?.orderStatus == e2?.orderStatus &&
        e1?.orderCreatedTime == e2?.orderCreatedTime;
  }

  @override
  int hash(OrdersRecord? e) =>
      const ListEquality().hash([e?.orderStatus, e?.orderCreatedTime]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
