// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PlacePickerStruct extends FFFirebaseStruct {
  PlacePickerStruct({
    LatLng? location,
    String? address,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _location = location,
        _address = address,
        super(firestoreUtilData);

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  set location(LatLng? val) => _location = val;

  bool hasLocation() => _location != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;

  bool hasAddress() => _address != null;

  static PlacePickerStruct fromMap(Map<String, dynamic> data) =>
      PlacePickerStruct(
        location: data['location'] as LatLng?,
        address: data['address'] as String?,
      );

  static PlacePickerStruct? maybeFromMap(dynamic data) => data is Map
      ? PlacePickerStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'location': _location,
        'address': _address,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'location': serializeParam(
          _location,
          ParamType.LatLng,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
      }.withoutNulls;

  static PlacePickerStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlacePickerStruct(
        location: deserializeParam(
          data['location'],
          ParamType.LatLng,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PlacePickerStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PlacePickerStruct &&
        location == other.location &&
        address == other.address;
  }

  @override
  int get hashCode => const ListEquality().hash([location, address]);
}

PlacePickerStruct createPlacePickerStruct({
  LatLng? location,
  String? address,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PlacePickerStruct(
      location: location,
      address: address,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PlacePickerStruct? updatePlacePickerStruct(
  PlacePickerStruct? placePicker, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    placePicker
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPlacePickerStructData(
  Map<String, dynamic> firestoreData,
  PlacePickerStruct? placePicker,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (placePicker == null) {
    return;
  }
  if (placePicker.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && placePicker.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final placePickerData =
      getPlacePickerFirestoreData(placePicker, forFieldValue);
  final nestedData =
      placePickerData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = placePicker.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPlacePickerFirestoreData(
  PlacePickerStruct? placePicker, [
  bool forFieldValue = false,
]) {
  if (placePicker == null) {
    return {};
  }
  final firestoreData = mapToFirestore(placePicker.toMap());

  // Add any Firestore field values
  placePicker.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPlacePickerListFirestoreData(
  List<PlacePickerStruct>? placePickers,
) =>
    placePickers?.map((e) => getPlacePickerFirestoreData(e, true)).toList() ??
    [];
