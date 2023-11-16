import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ProductsRecord extends FirestoreRecord {
  ProductsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "product_name" field.
  String? _productName;
  String get productName => _productName ?? '';
  bool hasProductName() => _productName != null;

  // "product_disc" field.
  String? _productDisc;
  String get productDisc => _productDisc ?? '';
  bool hasProductDisc() => _productDisc != null;

  // "product_link" field.
  String? _productLink;
  String get productLink => _productLink ?? '';
  bool hasProductLink() => _productLink != null;

  // "product_value" field.
  double? _productValue;
  double get productValue => _productValue ?? 0.0;
  bool hasProductValue() => _productValue != null;

  // "product_id" field.
  int? _productId;
  int get productId => _productId ?? 0;
  bool hasProductId() => _productId != null;

  // "product_is_active" field.
  bool? _productIsActive;
  bool get productIsActive => _productIsActive ?? false;
  bool hasProductIsActive() => _productIsActive != null;

  void _initializeFields() {
    _productName = snapshotData['product_name'] as String?;
    _productDisc = snapshotData['product_disc'] as String?;
    _productLink = snapshotData['product_link'] as String?;
    _productValue = castToType<double>(snapshotData['product_value']);
    _productId = castToType<int>(snapshotData['product_id']);
    _productIsActive = snapshotData['product_is_active'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('products');

  static Stream<ProductsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductsRecord.fromSnapshot(s));

  static Future<ProductsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductsRecord.fromSnapshot(s));

  static ProductsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductsRecordData({
  String? productName,
  String? productDisc,
  String? productLink,
  double? productValue,
  int? productId,
  bool? productIsActive,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'product_name': productName,
      'product_disc': productDisc,
      'product_link': productLink,
      'product_value': productValue,
      'product_id': productId,
      'product_is_active': productIsActive,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductsRecordDocumentEquality implements Equality<ProductsRecord> {
  const ProductsRecordDocumentEquality();

  @override
  bool equals(ProductsRecord? e1, ProductsRecord? e2) {
    return e1?.productName == e2?.productName &&
        e1?.productDisc == e2?.productDisc &&
        e1?.productLink == e2?.productLink &&
        e1?.productValue == e2?.productValue &&
        e1?.productId == e2?.productId &&
        e1?.productIsActive == e2?.productIsActive;
  }

  @override
  int hash(ProductsRecord? e) => const ListEquality().hash([
        e?.productName,
        e?.productDisc,
        e?.productLink,
        e?.productValue,
        e?.productId,
        e?.productIsActive
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductsRecord;
}
