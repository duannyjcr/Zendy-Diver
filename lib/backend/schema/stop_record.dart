import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StopRecord extends FirestoreRecord {
  StopRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "produc_tag" field.
  String? _producTag;
  String get producTag => _producTag ?? '';
  bool hasProducTag() => _producTag != null;

  // "receiver_name" field.
  String? _receiverName;
  String get receiverName => _receiverName ?? '';
  bool hasReceiverName() => _receiverName != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  bool hasCode() => _code != null;

  // "reciver_email" field.
  String? _reciverEmail;
  String get reciverEmail => _reciverEmail ?? '';
  bool hasReciverEmail() => _reciverEmail != null;

  // "id_delivery" field.
  DocumentReference? _idDelivery;
  DocumentReference? get idDelivery => _idDelivery;
  bool hasIdDelivery() => _idDelivery != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "comments" field.
  String? _comments;
  String get comments => _comments ?? '';
  bool hasComments() => _comments != null;

  // "receiver_phonenumber" field.
  String? _receiverPhonenumber;
  String get receiverPhonenumber => _receiverPhonenumber ?? '';
  bool hasReceiverPhonenumber() => _receiverPhonenumber != null;

  // "apt" field.
  String? _apt;
  String get apt => _apt ?? '';
  bool hasApt() => _apt != null;

  // "stopNumber" field.
  int? _stopNumber;
  int get stopNumber => _stopNumber ?? 0;
  bool hasStopNumber() => _stopNumber != null;

  // "is_delivered" field.
  DateTime? _isDelivered;
  DateTime? get isDelivered => _isDelivered;
  bool hasIsDelivered() => _isDelivered != null;

  void _initializeFields() {
    _address = snapshotData['address'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _producTag = snapshotData['produc_tag'] as String?;
    _receiverName = snapshotData['receiver_name'] as String?;
    _code = castToType<int>(snapshotData['code']);
    _reciverEmail = snapshotData['reciver_email'] as String?;
    _idDelivery = snapshotData['id_delivery'] as DocumentReference?;
    _uid = snapshotData['uid'] as String?;
    _comments = snapshotData['comments'] as String?;
    _receiverPhonenumber = snapshotData['receiver_phonenumber'] as String?;
    _apt = snapshotData['apt'] as String?;
    _stopNumber = castToType<int>(snapshotData['stopNumber']);
    _isDelivered = snapshotData['is_delivered'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('stop');

  static Stream<StopRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StopRecord.fromSnapshot(s));

  static Future<StopRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StopRecord.fromSnapshot(s));

  static StopRecord fromSnapshot(DocumentSnapshot snapshot) => StopRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StopRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StopRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StopRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StopRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStopRecordData({
  String? address,
  LatLng? location,
  String? producTag,
  String? receiverName,
  int? code,
  String? reciverEmail,
  DocumentReference? idDelivery,
  String? uid,
  String? comments,
  String? receiverPhonenumber,
  String? apt,
  int? stopNumber,
  DateTime? isDelivered,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'address': address,
      'location': location,
      'produc_tag': producTag,
      'receiver_name': receiverName,
      'code': code,
      'reciver_email': reciverEmail,
      'id_delivery': idDelivery,
      'uid': uid,
      'comments': comments,
      'receiver_phonenumber': receiverPhonenumber,
      'apt': apt,
      'stopNumber': stopNumber,
      'is_delivered': isDelivered,
    }.withoutNulls,
  );

  return firestoreData;
}

class StopRecordDocumentEquality implements Equality<StopRecord> {
  const StopRecordDocumentEquality();

  @override
  bool equals(StopRecord? e1, StopRecord? e2) {
    return e1?.address == e2?.address &&
        e1?.location == e2?.location &&
        e1?.producTag == e2?.producTag &&
        e1?.receiverName == e2?.receiverName &&
        e1?.code == e2?.code &&
        e1?.reciverEmail == e2?.reciverEmail &&
        e1?.idDelivery == e2?.idDelivery &&
        e1?.uid == e2?.uid &&
        e1?.comments == e2?.comments &&
        e1?.receiverPhonenumber == e2?.receiverPhonenumber &&
        e1?.apt == e2?.apt &&
        e1?.stopNumber == e2?.stopNumber &&
        e1?.isDelivered == e2?.isDelivered;
  }

  @override
  int hash(StopRecord? e) => const ListEquality().hash([
        e?.address,
        e?.location,
        e?.producTag,
        e?.receiverName,
        e?.code,
        e?.reciverEmail,
        e?.idDelivery,
        e?.uid,
        e?.comments,
        e?.receiverPhonenumber,
        e?.apt,
        e?.stopNumber,
        e?.isDelivered
      ]);

  @override
  bool isValidKey(Object? o) => o is StopRecord;
}
