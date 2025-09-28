import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _deliveryCurrent =
          prefs.getString('ff_deliveryCurrent')?.ref ?? _deliveryCurrent;
    });
    _safeInit(() {
      _stopCurrent = prefs
              .getStringList('ff_stopCurrent')
              ?.map((path) => path.ref)
              .toList() ??
          _stopCurrent;
    });
    _safeInit(() {
      _active = prefs.getBool('ff_active') ?? _active;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _selected = false;
  bool get selected => _selected;
  set selected(bool value) {
    _selected = value;
  }

  bool _hideDetails = false;
  bool get hideDetails => _hideDetails;
  set hideDetails(bool value) {
    _hideDetails = value;
  }

  PlacePickerStruct _locationTemp = PlacePickerStruct.fromSerializableMap(
      jsonDecode('{\"location\":\"-34.5408717,-55.93076000000001\"}'));
  PlacePickerStruct get locationTemp => _locationTemp;
  set locationTemp(PlacePickerStruct value) {
    _locationTemp = value;
  }

  void updateLocationTempStruct(Function(PlacePickerStruct) updateFn) {
    updateFn(_locationTemp);
  }

  DocumentReference? _deliveryCurrent =
      FirebaseFirestore.instance.doc('/delivery/JKrru4yGawlauA0wvb9c');
  DocumentReference? get deliveryCurrent => _deliveryCurrent;
  set deliveryCurrent(DocumentReference? value) {
    _deliveryCurrent = value;
    value != null
        ? prefs.setString('ff_deliveryCurrent', value.path)
        : prefs.remove('ff_deliveryCurrent');
  }

  List<DocumentReference> _stopCurrent = [];
  List<DocumentReference> get stopCurrent => _stopCurrent;
  set stopCurrent(List<DocumentReference> value) {
    _stopCurrent = value;
    prefs.setStringList('ff_stopCurrent', value.map((x) => x.path).toList());
  }

  void addToStopCurrent(DocumentReference value) {
    stopCurrent.add(value);
    prefs.setStringList(
        'ff_stopCurrent', _stopCurrent.map((x) => x.path).toList());
  }

  void removeFromStopCurrent(DocumentReference value) {
    stopCurrent.remove(value);
    prefs.setStringList(
        'ff_stopCurrent', _stopCurrent.map((x) => x.path).toList());
  }

  void removeAtIndexFromStopCurrent(int index) {
    stopCurrent.removeAt(index);
    prefs.setStringList(
        'ff_stopCurrent', _stopCurrent.map((x) => x.path).toList());
  }

  void updateStopCurrentAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    stopCurrent[index] = updateFn(_stopCurrent[index]);
    prefs.setStringList(
        'ff_stopCurrent', _stopCurrent.map((x) => x.path).toList());
  }

  void insertAtIndexInStopCurrent(int index, DocumentReference value) {
    stopCurrent.insert(index, value);
    prefs.setStringList(
        'ff_stopCurrent', _stopCurrent.map((x) => x.path).toList());
  }

  bool _active = false;
  bool get active => _active;
  set active(bool value) {
    _active = value;
    prefs.setBool('ff_active', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
