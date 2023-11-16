import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class CuponsRecord extends FirestoreRecord {
  CuponsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  bool hasCode() => _code != null;

  // "dueDate" field.
  DateTime? _dueDate;
  DateTime? get dueDate => _dueDate;
  bool hasDueDate() => _dueDate != null;

  // "value" field.
  double? _value;
  double get value => _value ?? 0.0;
  bool hasValue() => _value != null;

  void _initializeFields() {
    _code = snapshotData['code'] as String?;
    _dueDate = snapshotData['dueDate'] as DateTime?;
    _value = castToType<double>(snapshotData['value']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cupons');

  static Stream<CuponsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CuponsRecord.fromSnapshot(s));

  static Future<CuponsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CuponsRecord.fromSnapshot(s));

  static CuponsRecord fromSnapshot(DocumentSnapshot snapshot) => CuponsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CuponsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CuponsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CuponsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CuponsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCuponsRecordData({
  String? code,
  DateTime? dueDate,
  double? value,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'code': code,
      'dueDate': dueDate,
      'value': value,
    }.withoutNulls,
  );

  return firestoreData;
}

class CuponsRecordDocumentEquality implements Equality<CuponsRecord> {
  const CuponsRecordDocumentEquality();

  @override
  bool equals(CuponsRecord? e1, CuponsRecord? e2) {
    return e1?.code == e2?.code &&
        e1?.dueDate == e2?.dueDate &&
        e1?.value == e2?.value;
  }

  @override
  int hash(CuponsRecord? e) =>
      const ListEquality().hash([e?.code, e?.dueDate, e?.value]);

  @override
  bool isValidKey(Object? o) => o is CuponsRecord;
}
