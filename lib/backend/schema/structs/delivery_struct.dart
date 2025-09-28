// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DeliveryStruct extends FFFirebaseStruct {
  DeliveryStruct({
    String? pickupAddress,
    LatLng? pickupLocation,
    List<DocumentReference>? stops,
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
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _pickupAddress = pickupAddress,
        _pickupLocation = pickupLocation,
        _stops = stops,
        _idUserCustomer = idUserCustomer,
        _idUserDriver = idUserDriver,
        _driverLocation = driverLocation,
        _status = status,
        _price = price,
        _tips = tips,
        _driverProfit = driverProfit,
        _createDate = createDate,
        _updateDate = updateDate,
        _tag = tag,
        _apt = apt,
        _distance = distance,
        _estimatedTime = estimatedTime,
        _geometry = geometry,
        super(firestoreUtilData);

  // "pickup_address" field.
  String? _pickupAddress;
  String get pickupAddress => _pickupAddress ?? '';
  set pickupAddress(String? val) => _pickupAddress = val;

  bool hasPickupAddress() => _pickupAddress != null;

  // "pickup_location" field.
  LatLng? _pickupLocation;
  LatLng? get pickupLocation => _pickupLocation;
  set pickupLocation(LatLng? val) => _pickupLocation = val;

  bool hasPickupLocation() => _pickupLocation != null;

  // "stops" field.
  List<DocumentReference>? _stops;
  List<DocumentReference> get stops => _stops ?? const [];
  set stops(List<DocumentReference>? val) => _stops = val;

  void updateStops(Function(List<DocumentReference>) updateFn) {
    updateFn(_stops ??= []);
  }

  bool hasStops() => _stops != null;

  // "id_user_customer" field.
  DocumentReference? _idUserCustomer;
  DocumentReference? get idUserCustomer => _idUserCustomer;
  set idUserCustomer(DocumentReference? val) => _idUserCustomer = val;

  bool hasIdUserCustomer() => _idUserCustomer != null;

  // "id_user_driver" field.
  DocumentReference? _idUserDriver;
  DocumentReference? get idUserDriver => _idUserDriver;
  set idUserDriver(DocumentReference? val) => _idUserDriver = val;

  bool hasIdUserDriver() => _idUserDriver != null;

  // "driver_location" field.
  LatLng? _driverLocation;
  LatLng? get driverLocation => _driverLocation;
  set driverLocation(LatLng? val) => _driverLocation = val;

  bool hasDriverLocation() => _driverLocation != null;

  // "status" field.
  DeliveryStatus? _status;
  DeliveryStatus get status => _status ?? DeliveryStatus.draft;
  set status(DeliveryStatus? val) => _status = val;

  bool hasStatus() => _status != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;

  void incrementPrice(double amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "tips" field.
  double? _tips;
  double get tips => _tips ?? 0.0;
  set tips(double? val) => _tips = val;

  void incrementTips(double amount) => tips = tips + amount;

  bool hasTips() => _tips != null;

  // "driver_profit" field.
  double? _driverProfit;
  double get driverProfit => _driverProfit ?? 0.0;
  set driverProfit(double? val) => _driverProfit = val;

  void incrementDriverProfit(double amount) =>
      driverProfit = driverProfit + amount;

  bool hasDriverProfit() => _driverProfit != null;

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  set createDate(DateTime? val) => _createDate = val;

  bool hasCreateDate() => _createDate != null;

  // "update_date" field.
  DateTime? _updateDate;
  DateTime? get updateDate => _updateDate;
  set updateDate(DateTime? val) => _updateDate = val;

  bool hasUpdateDate() => _updateDate != null;

  // "tag" field.
  String? _tag;
  String get tag => _tag ?? '';
  set tag(String? val) => _tag = val;

  bool hasTag() => _tag != null;

  // "apt" field.
  String? _apt;
  String get apt => _apt ?? '';
  set apt(String? val) => _apt = val;

  bool hasApt() => _apt != null;

  // "distance" field.
  double? _distance;
  double get distance => _distance ?? 0.0;
  set distance(double? val) => _distance = val;

  void incrementDistance(double amount) => distance = distance + amount;

  bool hasDistance() => _distance != null;

  // "estimatedTime" field.
  double? _estimatedTime;
  double get estimatedTime => _estimatedTime ?? 0.0;
  set estimatedTime(double? val) => _estimatedTime = val;

  void incrementEstimatedTime(double amount) =>
      estimatedTime = estimatedTime + amount;

  bool hasEstimatedTime() => _estimatedTime != null;

  // "geometry" field.
  String? _geometry;
  String get geometry => _geometry ?? '';
  set geometry(String? val) => _geometry = val;

  bool hasGeometry() => _geometry != null;

  static DeliveryStruct fromMap(Map<String, dynamic> data) => DeliveryStruct(
        pickupAddress: data['pickup_address'] as String?,
        pickupLocation: data['pickup_location'] as LatLng?,
        stops: getDataList(data['stops']),
        idUserCustomer: data['id_user_customer'] as DocumentReference?,
        idUserDriver: data['id_user_driver'] as DocumentReference?,
        driverLocation: data['driver_location'] as LatLng?,
        status: data['status'] is DeliveryStatus
            ? data['status']
            : deserializeEnum<DeliveryStatus>(data['status']),
        price: castToType<double>(data['price']),
        tips: castToType<double>(data['tips']),
        driverProfit: castToType<double>(data['driver_profit']),
        createDate: data['create_date'] as DateTime?,
        updateDate: data['update_date'] as DateTime?,
        tag: data['tag'] as String?,
        apt: data['apt'] as String?,
        distance: castToType<double>(data['distance']),
        estimatedTime: castToType<double>(data['estimatedTime']),
        geometry: data['geometry'] as String?,
      );

  static DeliveryStruct? maybeFromMap(dynamic data) =>
      data is Map ? DeliveryStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'pickup_address': _pickupAddress,
        'pickup_location': _pickupLocation,
        'stops': _stops,
        'id_user_customer': _idUserCustomer,
        'id_user_driver': _idUserDriver,
        'driver_location': _driverLocation,
        'status': _status?.serialize(),
        'price': _price,
        'tips': _tips,
        'driver_profit': _driverProfit,
        'create_date': _createDate,
        'update_date': _updateDate,
        'tag': _tag,
        'apt': _apt,
        'distance': _distance,
        'estimatedTime': _estimatedTime,
        'geometry': _geometry,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'pickup_address': serializeParam(
          _pickupAddress,
          ParamType.String,
        ),
        'pickup_location': serializeParam(
          _pickupLocation,
          ParamType.LatLng,
        ),
        'stops': serializeParam(
          _stops,
          ParamType.DocumentReference,
          isList: true,
        ),
        'id_user_customer': serializeParam(
          _idUserCustomer,
          ParamType.DocumentReference,
        ),
        'id_user_driver': serializeParam(
          _idUserDriver,
          ParamType.DocumentReference,
        ),
        'driver_location': serializeParam(
          _driverLocation,
          ParamType.LatLng,
        ),
        'status': serializeParam(
          _status,
          ParamType.Enum,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'tips': serializeParam(
          _tips,
          ParamType.double,
        ),
        'driver_profit': serializeParam(
          _driverProfit,
          ParamType.double,
        ),
        'create_date': serializeParam(
          _createDate,
          ParamType.DateTime,
        ),
        'update_date': serializeParam(
          _updateDate,
          ParamType.DateTime,
        ),
        'tag': serializeParam(
          _tag,
          ParamType.String,
        ),
        'apt': serializeParam(
          _apt,
          ParamType.String,
        ),
        'distance': serializeParam(
          _distance,
          ParamType.double,
        ),
        'estimatedTime': serializeParam(
          _estimatedTime,
          ParamType.double,
        ),
        'geometry': serializeParam(
          _geometry,
          ParamType.String,
        ),
      }.withoutNulls;

  static DeliveryStruct fromSerializableMap(Map<String, dynamic> data) =>
      DeliveryStruct(
        pickupAddress: deserializeParam(
          data['pickup_address'],
          ParamType.String,
          false,
        ),
        pickupLocation: deserializeParam(
          data['pickup_location'],
          ParamType.LatLng,
          false,
        ),
        stops: deserializeParam<DocumentReference>(
          data['stops'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['stop'],
        ),
        idUserCustomer: deserializeParam(
          data['id_user_customer'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['user'],
        ),
        idUserDriver: deserializeParam(
          data['id_user_driver'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['user'],
        ),
        driverLocation: deserializeParam(
          data['driver_location'],
          ParamType.LatLng,
          false,
        ),
        status: deserializeParam<DeliveryStatus>(
          data['status'],
          ParamType.Enum,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        tips: deserializeParam(
          data['tips'],
          ParamType.double,
          false,
        ),
        driverProfit: deserializeParam(
          data['driver_profit'],
          ParamType.double,
          false,
        ),
        createDate: deserializeParam(
          data['create_date'],
          ParamType.DateTime,
          false,
        ),
        updateDate: deserializeParam(
          data['update_date'],
          ParamType.DateTime,
          false,
        ),
        tag: deserializeParam(
          data['tag'],
          ParamType.String,
          false,
        ),
        apt: deserializeParam(
          data['apt'],
          ParamType.String,
          false,
        ),
        distance: deserializeParam(
          data['distance'],
          ParamType.double,
          false,
        ),
        estimatedTime: deserializeParam(
          data['estimatedTime'],
          ParamType.double,
          false,
        ),
        geometry: deserializeParam(
          data['geometry'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DeliveryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DeliveryStruct &&
        pickupAddress == other.pickupAddress &&
        pickupLocation == other.pickupLocation &&
        listEquality.equals(stops, other.stops) &&
        idUserCustomer == other.idUserCustomer &&
        idUserDriver == other.idUserDriver &&
        driverLocation == other.driverLocation &&
        status == other.status &&
        price == other.price &&
        tips == other.tips &&
        driverProfit == other.driverProfit &&
        createDate == other.createDate &&
        updateDate == other.updateDate &&
        tag == other.tag &&
        apt == other.apt &&
        distance == other.distance &&
        estimatedTime == other.estimatedTime &&
        geometry == other.geometry;
  }

  @override
  int get hashCode => const ListEquality().hash([
        pickupAddress,
        pickupLocation,
        stops,
        idUserCustomer,
        idUserDriver,
        driverLocation,
        status,
        price,
        tips,
        driverProfit,
        createDate,
        updateDate,
        tag,
        apt,
        distance,
        estimatedTime,
        geometry
      ]);
}

DeliveryStruct createDeliveryStruct({
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
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DeliveryStruct(
      pickupAddress: pickupAddress,
      pickupLocation: pickupLocation,
      idUserCustomer: idUserCustomer,
      idUserDriver: idUserDriver,
      driverLocation: driverLocation,
      status: status,
      price: price,
      tips: tips,
      driverProfit: driverProfit,
      createDate: createDate,
      updateDate: updateDate,
      tag: tag,
      apt: apt,
      distance: distance,
      estimatedTime: estimatedTime,
      geometry: geometry,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DeliveryStruct? updateDeliveryStruct(
  DeliveryStruct? delivery, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    delivery
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDeliveryStructData(
  Map<String, dynamic> firestoreData,
  DeliveryStruct? delivery,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (delivery == null) {
    return;
  }
  if (delivery.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && delivery.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final deliveryData = getDeliveryFirestoreData(delivery, forFieldValue);
  final nestedData = deliveryData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = delivery.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDeliveryFirestoreData(
  DeliveryStruct? delivery, [
  bool forFieldValue = false,
]) {
  if (delivery == null) {
    return {};
  }
  final firestoreData = mapToFirestore(delivery.toMap());

  // Add any Firestore field values
  delivery.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDeliveryListFirestoreData(
  List<DeliveryStruct>? deliverys,
) =>
    deliverys?.map((e) => getDeliveryFirestoreData(e, true)).toList() ?? [];
