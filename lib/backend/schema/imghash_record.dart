import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ImghashRecord extends FirestoreRecord {
  ImghashRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "srno" field.
  int? _srno;
  int get srno => _srno ?? 0;
  bool hasSrno() => _srno != null;

  // "hash" field.
  String? _hash;
  String get hash => _hash ?? '';
  bool hasHash() => _hash != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  bool hasImg() => _img != null;

  void _initializeFields() {
    _srno = castToType<int>(snapshotData['srno']);
    _hash = snapshotData['hash'] as String?;
    _img = snapshotData['img'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('imghash');

  static Stream<ImghashRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ImghashRecord.fromSnapshot(s));

  static Future<ImghashRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ImghashRecord.fromSnapshot(s));

  static ImghashRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ImghashRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ImghashRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ImghashRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ImghashRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ImghashRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createImghashRecordData({
  int? srno,
  String? hash,
  String? img,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'srno': srno,
      'hash': hash,
      'img': img,
    }.withoutNulls,
  );

  return firestoreData;
}

class ImghashRecordDocumentEquality implements Equality<ImghashRecord> {
  const ImghashRecordDocumentEquality();

  @override
  bool equals(ImghashRecord? e1, ImghashRecord? e2) {
    return e1?.srno == e2?.srno && e1?.hash == e2?.hash && e1?.img == e2?.img;
  }

  @override
  int hash(ImghashRecord? e) =>
      const ListEquality().hash([e?.srno, e?.hash, e?.img]);

  @override
  bool isValidKey(Object? o) => o is ImghashRecord;
}
