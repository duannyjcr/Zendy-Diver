// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class StopStruct extends FFFirebaseStruct {
  StopStruct({
    String? uid,
    String? address,
    LatLng? location,
    String? producTag,
    String? receiverName,
    int? code,
    String? receiverEmail,
    DocumentReference? idDelivery,
    String? comments,
    String? receiverPhonenumber,
    String? apt,
    int? stopNumber,
    DateTime? isDelivered,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _uid = uid,
        _address = address,
        _location = location,
        _producTag = producTag,
        _receiverName = receiverName,
        _code = code,
        _receiverEmail = receiverEmail,
        _idDelivery = idDelivery,
        _comments = comments,
        _receiverPhonenumber = receiverPhonenumber,
        _apt = apt,
        _stopNumber = stopNumber,
        _isDelivered = isDelivered,
        super(firestoreUtilData);

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  set uid(String? val) => _uid = val;

  bool hasUid() => _uid != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;

  bool hasAddress() => _address != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  set location(LatLng? val) => _location = val;

  bool hasLocation() => _location != null;

  // "produc_tag" field.
  String? _producTag;
  String get producTag => _producTag ?? '';
  set producTag(String? val) => _producTag = val;

  bool hasProducTag() => _producTag != null;

  // "receiver_name" field.
  String? _receiverName;
  String get receiverName => _receiverName ?? '';
  set receiverName(String? val) => _receiverName = val;

  bool hasReceiverName() => _receiverName != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  set code(int? val) => _code = val;

  void incrementCode(int amount) => code = code + amount;

  bool hasCode() => _code != null;

  // "receiver_email" field.
  String? _receiverEmail;
  String get receiverEmail => _receiverEmail ?? '';
  set receiverEmail(String? val) => _receiverEmail = val;

  bool hasReceiverEmail() => _receiverEmail != null;

  // "id_delivery" field.
  DocumentReference? _idDelivery;
  DocumentReference? get idDelivery => _idDelivery;
  set idDelivery(DocumentReference? val) => _idDelivery = val;

  bool hasIdDelivery() => _idDelivery != null;

  // "comments" field.
  String? _comments;
  String get comments => _comments ?? '';
  set comments(String? val) => _comments = val;

  bool hasComments() => _comments != null;

  // "receiver_phonenumber" field.
  String? _receiverPhonenumber;
  String get receiverPhonenumber => _receiverPhonenumber ?? '';
  set receiverPhonenumber(String? val) => _receiverPhonenumber = val;

  bool hasReceiverPhonenumber() => _receiverPhonenumber != null;

  // "apt" field.
  String? _apt;
  String get apt => _apt ?? '';
  set apt(String? val) => _apt = val;

  bool hasApt() => _apt != null;

  // "stopNumber" field.
  int? _stopNumber;
  int get stopNumber => _stopNumber ?? 0;
  set stopNumber(int? val) => _stopNumber = val;

  void incrementStopNumber(int amount) => stopNumber = stopNumber + amount;

  bool hasStopNumber() => _stopNumber != null;

  // "is_delivered" field.
  DateTime? _isDelivered;
  DateTime? get isDelivered => _isDelivered;
  set isDelivered(DateTime? val) => _isDelivered = val;

  bool hasIsDelivered() => _isDelivered != null;

  static StopStruct fromMap(Map<String, dynamic> data) => StopStruct(
        uid: data['uid'] as String?,
        address: data['address'] as String?,
        location: data['location'] as LatLng?,
        producTag: data['produc_tag'] as String?,
        receiverName: data['receiver_name'] as String?,
        code: castToType<int>(data['code']),
        receiverEmail: data['receiver_email'] as String?,
        idDelivery: data['id_delivery'] as DocumentReference?,
        comments: data['comments'] as String?,
        receiverPhonenumber: data['receiver_phonenumber'] as String?,
        apt: data['apt'] as String?,
        stopNumber: castToType<int>(data['stopNumber']),
        isDelivered: data['is_delivered'] as DateTime?,
      );

  static StopStruct? maybeFromMap(dynamic data) =>
      data is Map ? StopStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'uid': _uid,
        'address': _address,
        'location': _location,
        'produc_tag': _producTag,
        'receiver_name': _receiverName,
        'code': _code,
        'receiver_email': _receiverEmail,
        'id_delivery': _idDelivery,
        'comments': _comments,
        'receiver_phonenumber': _receiverPhonenumber,
        'apt': _apt,
        'stopNumber': _stopNumber,
        'is_delivered': _isDelivered,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'uid': serializeParam(
          _uid,
          ParamType.String,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'location': serializeParam(
          _location,
          ParamType.LatLng,
        ),
        'produc_tag': serializeParam(
          _producTag,
          ParamType.String,
        ),
        'receiver_name': serializeParam(
          _receiverName,
          ParamType.String,
        ),
        'code': serializeParam(
          _code,
          ParamType.int,
        ),
        'receiver_email': serializeParam(
          _receiverEmail,
          ParamType.String,
        ),
        'id_delivery': serializeParam(
          _idDelivery,
          ParamType.DocumentReference,
        ),
        'comments': serializeParam(
          _comments,
          ParamType.String,
        ),
        'receiver_phonenumber': serializeParam(
          _receiverPhonenumber,
          ParamType.String,
        ),
        'apt': serializeParam(
          _apt,
          ParamType.String,
        ),
        'stopNumber': serializeParam(
          _stopNumber,
          ParamType.int,
        ),
        'is_delivered': serializeParam(
          _isDelivered,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static StopStruct fromSerializableMap(Map<String, dynamic> data) =>
      StopStruct(
        uid: deserializeParam(
          data['uid'],
          ParamType.String,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        location: deserializeParam(
          data['location'],
          ParamType.LatLng,
          false,
        ),
        producTag: deserializeParam(
          data['produc_tag'],
          ParamType.String,
          false,
        ),
        receiverName: deserializeParam(
          data['receiver_name'],
          ParamType.String,
          false,
        ),
        code: deserializeParam(
          data['code'],
          ParamType.int,
          false,
        ),
        receiverEmail: deserializeParam(
          data['receiver_email'],
          ParamType.String,
          false,
        ),
        idDelivery: deserializeParam(
          data['id_delivery'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['delivery'],
        ),
        comments: deserializeParam(
          data['comments'],
          ParamType.String,
          false,
        ),
        receiverPhonenumber: deserializeParam(
          data['receiver_phonenumber'],
          ParamType.String,
          false,
        ),
        apt: deserializeParam(
          data['apt'],
          ParamType.String,
          false,
        ),
        stopNumber: deserializeParam(
          data['stopNumber'],
          ParamType.int,
          false,
        ),
        isDelivered: deserializeParam(
          data['is_delivered'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'StopStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StopStruct &&
        uid == other.uid &&
        address == other.address &&
        location == other.location &&
        producTag == other.producTag &&
        receiverName == other.receiverName &&
        code == other.code &&
        receiverEmail == other.receiverEmail &&
        idDelivery == other.idDelivery &&
        comments == other.comments &&
        receiverPhonenumber == other.receiverPhonenumber &&
        apt == other.apt &&
        stopNumber == other.stopNumber &&
        isDelivered == other.isDelivered;
  }

  @override
  int get hashCode => const ListEquality().hash([
        uid,
        address,
        location,
        producTag,
        receiverName,
        code,
        receiverEmail,
        idDelivery,
        comments,
        receiverPhonenumber,
        apt,
        stopNumber,
        isDelivered
      ]);
}

StopStruct createStopStruct({
  String? uid,
  String? address,
  LatLng? location,
  String? producTag,
  String? receiverName,
  int? code,
  String? receiverEmail,
  DocumentReference? idDelivery,
  String? comments,
  String? receiverPhonenumber,
  String? apt,
  int? stopNumber,
  DateTime? isDelivered,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StopStruct(
      uid: uid,
      address: address,
      location: location,
      producTag: producTag,
      receiverName: receiverName,
      code: code,
      receiverEmail: receiverEmail,
      idDelivery: idDelivery,
      comments: comments,
      receiverPhonenumber: receiverPhonenumber,
      apt: apt,
      stopNumber: stopNumber,
      isDelivered: isDelivered,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StopStruct? updateStopStruct(
  StopStruct? stop, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    stop
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStopStructData(
  Map<String, dynamic> firestoreData,
  StopStruct? stop,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (stop == null) {
    return;
  }
  if (stop.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && stop.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final stopData = getStopFirestoreData(stop, forFieldValue);
  final nestedData = stopData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = stop.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStopFirestoreData(
  StopStruct? stop, [
  bool forFieldValue = false,
]) {
  if (stop == null) {
    return {};
  }
  final firestoreData = mapToFirestore(stop.toMap());

  // Add any Firestore field values
  stop.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStopListFirestoreData(
  List<StopStruct>? stops,
) =>
    stops?.map((e) => getStopFirestoreData(e, true)).toList() ?? [];
