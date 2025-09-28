import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// This collection stores the paymehnts made by a particular client, for a
/// particular delivery
class PaymentRecord extends FirestoreRecord {
  PaymentRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "mp_payment_id" field.
  String? _mpPaymentId;
  String get mpPaymentId => _mpPaymentId ?? '';
  bool hasMpPaymentId() => _mpPaymentId != null;

  // "delivery_id" field.
  DocumentReference? _deliveryId;
  DocumentReference? get deliveryId => _deliveryId;
  bool hasDeliveryId() => _deliveryId != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "payment_date" field.
  DateTime? _paymentDate;
  DateTime? get paymentDate => _paymentDate;
  bool hasPaymentDate() => _paymentDate != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _mpPaymentId = snapshotData['mp_payment_id'] as String?;
    _deliveryId = snapshotData['delivery_id'] as DocumentReference?;
    _amount = castToType<double>(snapshotData['amount']);
    _paymentDate = snapshotData['payment_date'] as DateTime?;
    _status = snapshotData['status'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('payment');

  static Stream<PaymentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PaymentRecord.fromSnapshot(s));

  static Future<PaymentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PaymentRecord.fromSnapshot(s));

  static PaymentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PaymentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PaymentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PaymentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PaymentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PaymentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPaymentRecordData({
  String? mpPaymentId,
  DocumentReference? deliveryId,
  double? amount,
  DateTime? paymentDate,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'mp_payment_id': mpPaymentId,
      'delivery_id': deliveryId,
      'amount': amount,
      'payment_date': paymentDate,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class PaymentRecordDocumentEquality implements Equality<PaymentRecord> {
  const PaymentRecordDocumentEquality();

  @override
  bool equals(PaymentRecord? e1, PaymentRecord? e2) {
    return e1?.mpPaymentId == e2?.mpPaymentId &&
        e1?.deliveryId == e2?.deliveryId &&
        e1?.amount == e2?.amount &&
        e1?.paymentDate == e2?.paymentDate &&
        e1?.status == e2?.status;
  }

  @override
  int hash(PaymentRecord? e) => const ListEquality().hash(
      [e?.mpPaymentId, e?.deliveryId, e?.amount, e?.paymentDate, e?.status]);

  @override
  bool isValidKey(Object? o) => o is PaymentRecord;
}
