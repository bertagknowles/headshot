import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SampleDataRecord extends FirestoreRecord {
  SampleDataRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "operation01" field.
  String? _operation01;
  String get operation01 => _operation01 ?? '';
  bool hasOperation01() => _operation01 != null;

  // "results01" field.
  String? _results01;
  String get results01 => _results01 ?? '';
  bool hasResults01() => _results01 != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  void _initializeFields() {
    _operation01 = snapshotData['operation01'] as String?;
    _results01 = snapshotData['results01'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sample_data');

  static Stream<SampleDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SampleDataRecord.fromSnapshot(s));

  static Future<SampleDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SampleDataRecord.fromSnapshot(s));

  static SampleDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SampleDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SampleDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SampleDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SampleDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SampleDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSampleDataRecordData({
  String? operation01,
  String? results01,
  DateTime? createdTime,
  String? phoneNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'operation01': operation01,
      'results01': results01,
      'created_time': createdTime,
      'phone_number': phoneNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class SampleDataRecordDocumentEquality implements Equality<SampleDataRecord> {
  const SampleDataRecordDocumentEquality();

  @override
  bool equals(SampleDataRecord? e1, SampleDataRecord? e2) {
    return e1?.operation01 == e2?.operation01 &&
        e1?.results01 == e2?.results01 &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber;
  }

  @override
  int hash(SampleDataRecord? e) => const ListEquality()
      .hash([e?.operation01, e?.results01, e?.createdTime, e?.phoneNumber]);

  @override
  bool isValidKey(Object? o) => o is SampleDataRecord;
}
