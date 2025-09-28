import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DeliveryRecord extends FirestoreRecord {
  DeliveryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "pickup_address" field.
  String? _pickupAddress;
  String get pickupAddress => _pickupAddress ?? '';
  bool hasPickupAddress() => _pickupAddress != null;

  // "pickup_location" field.
  LatLng? _pickupLocation;
  LatLng? get pickupLocation => _pickupLocation;
  bool hasPickupLocation() => _pickupLocation != null;

  // "id_user_customer" field.
  DocumentReference? _idUserCustomer;
  DocumentReference? get idUserCustomer => _idUserCustomer;
  bool hasIdUserCustomer() => _idUserCustomer != null;

  // "id_user_driver" field.
  DocumentReference? _idUserDriver;
  DocumentReference? get idUserDriver => _idUserDriver;
  bool hasIdUserDriver() => _idUserDriver != null;

  // "driver_location" field.
  LatLng? _driverLocation;
  LatLng? get driverLocation => _driverLocation;
  bool hasDriverLocation() => _driverLocation != null;

  // "status" field.
  DeliveryStatus? _status;
  DeliveryStatus? get status => _status;
  bool hasStatus() => _status != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "tips" field.
  double? _tips;
  double get tips => _tips ?? 0.0;
  bool hasTips() => _tips != null;

  // "driver_profit" field.
  double? _driverProfit;
  double get driverProfit => _driverProfit ?? 0.0;
  bool hasDriverProfit() => _driverProfit != null;

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "update_date" field.
  DateTime? _updateDate;
  DateTime? get updateDate => _updateDate;
  bool hasUpdateDate() => _updateDate != null;

  // "tag" field.
  String? _tag;
  String get tag => _tag ?? '';
  bool hasTag() => _tag != null;

  // "apt" field.
  String? _apt;
  String get apt => _apt ?? '';
  bool hasApt() => _apt != null;

  // "distance" field.
  double? _distance;
  double get distance => _distance ?? 0.0;
  bool hasDistance() => _distance != null;

  // "estimatedTime" field.
  double? _estimatedTime;
  double get estimatedTime => _estimatedTime ?? 0.0;
  bool hasEstimatedTime() => _estimatedTime != null;

  // "stops" field.
  List<DocumentReference>? _stops;
  List<DocumentReference> get stops => _stops ?? const [];
  bool hasStops() => _stops != null;

  // "geometry" field.
  String? _geometry;
  String get geometry => _geometry ?? '';
  bool hasGeometry() => _geometry != null;

  void _initializeFields() {
    _pickupAddress = snapshotData['pickup_address'] as String?;
    _pickupLocation = snapshotData['pickup_location'] as LatLng?;
    _idUserCustomer = snapshotData['id_user_customer'] as DocumentReference?;
    _idUserDriver = snapshotData['id_user_driver'] as DocumentReference?;
    _driverLocation = snapshotData['driver_location'] as LatLng?;
    _status = snapshotData['status'] is DeliveryStatus
        ? snapshotData['status']
        : deserializeEnum<DeliveryStatus>(snapshotData['status']);
    _price = castToType<double>(snapshotData['price']);
    _tips = castToType<double>(snapshotData['tips']);
    _driverProfit = castToType<double>(snapshotData['driver_profit']);
    _createDate = snapshotData['create_date'] as DateTime?;
    _updateDate = snapshotData['update_date'] as DateTime?;
    _tag = snapshotData['tag'] as String?;
    _apt = snapshotData['apt'] as String?;
    _distance = castToType<double>(snapshotData['distance']);
    _estimatedTime = castToType<double>(snapshotData['estimatedTime']);
    _stops = getDataList(snapshotData['stops']);
    _geometry = snapshotData['geometry'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('delivery');

  static Stream<DeliveryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DeliveryRecord.fromSnapshot(s));

  static Future<DeliveryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DeliveryRecord.fromSnapshot(s));

  static DeliveryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DeliveryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DeliveryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DeliveryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DeliveryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DeliveryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDeliveryRecordData({
  String? pickupAddress,
  LatLng? pickupLocation,
  DocumentReference? idUserCustomer,
  DocumentReference? idUserDriver,
  LatLng? driverLocation,
  DeliveryStatus? status,
  double? price,
  double? tips,
  double? driverProfit,
  DateTime? createDate,
  DateTime? updateDate,
  String? tag,
  String? apt,
  double? distance,
  double? estimatedTime,
  String? geometry,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'pickup_address': pickupAddress,
      'pickup_location': pickupLocation,
      'id_user_customer': idUserCustomer,
      'id_user_driver': idUserDriver,
      'driver_location': driverLocation,
      'status': status,
      'price': price,
      'tips': tips,
      'driver_profit': driverProfit,
      'create_date': createDate,
      'update_date': updateDate,
      'tag': tag,
      'apt': apt,
      'distance': distance,
      'estimatedTime': estimatedTime,
      'geometry': geometry,
    }.withoutNulls,
  );

  return firestoreData;
}

class DeliveryRecordDocumentEquality implements Equality<DeliveryRecord> {
  const DeliveryRecordDocumentEquality();

  @override
  bool equals(DeliveryRecord? e1, DeliveryRecord? e2) {
    const listEquality = ListEquality();
    return e1?.pickupAddress == e2?.pickupAddress &&
        e1?.pickupLocation == e2?.pickupLocation &&
        e1?.idUserCustomer == e2?.idUserCustomer &&
        e1?.idUserDriver == e2?.idUserDriver &&
        e1?.driverLocation == e2?.driverLocation &&
        e1?.status == e2?.status &&
        e1?.price == e2?.price &&
        e1?.tips == e2?.tips &&
        e1?.driverProfit == e2?.driverProfit &&
        e1?.createDate == e2?.createDate &&
        e1?.updateDate == e2?.updateDate &&
        e1?.tag == e2?.tag &&
        e1?.apt == e2?.apt &&
        e1?.distance == e2?.distance &&
        e1?.estimatedTime == e2?.estimatedTime &&
        listEquality.equals(e1?.stops, e2?.stops) &&
        e1?.geometry == e2?.geometry;
  }

  @override
  int hash(DeliveryRecord? e) => const ListEquality().hash([
        e?.pickupAddress,
        e?.pickupLocation,
        e?.idUserCustomer,
        e?.idUserDriver,
        e?.driverLocation,
        e?.status,
        e?.price,
        e?.tips,
        e?.driverProfit,
        e?.createDate,
        e?.updateDate,
        e?.tag,
        e?.apt,
        e?.distance,
        e?.estimatedTime,
        e?.stops,
        e?.geometry
      ]);

  @override
  bool isValidKey(Object? o) => o is DeliveryRecord;
}
