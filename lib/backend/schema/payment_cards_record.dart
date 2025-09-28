import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// This table allows the storage of user ralated card payment method.
///
/// It  has a one to many relationship with user
class PaymentCardsRecord extends FirestoreRecord {
  PaymentCardsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "mp_card_id" field.
  String? _mpCardId;
  String get mpCardId => _mpCardId ?? '';
  bool hasMpCardId() => _mpCardId != null;

  // "bin" field.
  String? _bin;
  String get bin => _bin ?? '';
  bool hasBin() => _bin != null;

  // "last_four_numbers" field.
  String? _lastFourNumbers;
  String get lastFourNumbers => _lastFourNumbers ?? '';
  bool hasLastFourNumbers() => _lastFourNumbers != null;

  // "ofuscated_pan" field.
  String? _ofuscatedPan;
  String get ofuscatedPan => _ofuscatedPan ?? '';
  bool hasOfuscatedPan() => _ofuscatedPan != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  void _initializeFields() {
    _mpCardId = snapshotData['mp_card_id'] as String?;
    _bin = snapshotData['bin'] as String?;
    _lastFourNumbers = snapshotData['last_four_numbers'] as String?;
    _ofuscatedPan = snapshotData['ofuscated_pan'] as String?;
    _type = snapshotData['type'] as String?;
    _userId = snapshotData['user_id'] as DocumentReference?;
    _active = snapshotData['active'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('paymentCards');

  static Stream<PaymentCardsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PaymentCardsRecord.fromSnapshot(s));

  static Future<PaymentCardsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PaymentCardsRecord.fromSnapshot(s));

  static PaymentCardsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PaymentCardsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PaymentCardsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PaymentCardsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PaymentCardsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PaymentCardsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPaymentCardsRecordData({
  String? mpCardId,
  String? bin,
  String? lastFourNumbers,
  String? ofuscatedPan,
  String? type,
  DocumentReference? userId,
  bool? active,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'mp_card_id': mpCardId,
      'bin': bin,
      'last_four_numbers': lastFourNumbers,
      'ofuscated_pan': ofuscatedPan,
      'type': type,
      'user_id': userId,
      'active': active,
    }.withoutNulls,
  );

  return firestoreData;
}

class PaymentCardsRecordDocumentEquality
    implements Equality<PaymentCardsRecord> {
  const PaymentCardsRecordDocumentEquality();

  @override
  bool equals(PaymentCardsRecord? e1, PaymentCardsRecord? e2) {
    return e1?.mpCardId == e2?.mpCardId &&
        e1?.bin == e2?.bin &&
        e1?.lastFourNumbers == e2?.lastFourNumbers &&
        e1?.ofuscatedPan == e2?.ofuscatedPan &&
        e1?.type == e2?.type &&
        e1?.userId == e2?.userId &&
        e1?.active == e2?.active;
  }

  @override
  int hash(PaymentCardsRecord? e) => const ListEquality().hash([
        e?.mpCardId,
        e?.bin,
        e?.lastFourNumbers,
        e?.ofuscatedPan,
        e?.type,
        e?.userId,
        e?.active
      ]);

  @override
  bool isValidKey(Object? o) => o is PaymentCardsRecord;
}
