import 'dart:async';

import 'serialization_util.dart';
import '/backend/backend.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.white,
          child: Image.asset(
            'assets/images/icono+zendy.svg',
            fit: BoxFit.contain,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'Onboarding': ParameterData.none(),
  'CreateAccount': ParameterData.none(),
  'Verification': ParameterData.none(),
  'LoginAccount': ParameterData.none(),
  'MyOrder': ParameterData.none(),
  'Notifications': ParameterData.none(),
  'Setting': ParameterData.none(),
  'EditProfile': (data) async => ParameterData(
        allParams: {
          'driver': await getDocumentParameter<UserRecord>(
              data, 'driver', UserRecord.fromSnapshot),
        },
      ),
  'ChangePassword': ParameterData.none(),
  'Language': ParameterData.none(),
  'NotificationSetting': ParameterData.none(),
  'Security': ParameterData.none(),
  'HelpandSupport': ParameterData.none(),
  'LegalAndPolicies': ParameterData.none(),
  'Home': ParameterData.none(),
  'DeliveryMap': (data) async => ParameterData(
        allParams: {
          'deliveryReference':
              getParameter<DocumentReference>(data, 'deliveryReference'),
          'location': getParameter<LatLng>(data, 'location'),
        },
      ),
  'AddNewCard': ParameterData.none(),
  'StopMap': (data) async => ParameterData(
        allParams: {
          'location': getParameter<LatLng>(data, 'location'),
        },
      ),
  'DeltailsDelivery': (data) async => ParameterData(
        allParams: {
          'deliveryReference':
              getParameter<DocumentReference>(data, 'deliveryReference'),
        },
      ),
  'DetailsStop': (data) async => ParameterData(
        allParams: {
          'stopDetails': await getDocumentParameter<StopRecord>(
              data, 'stopDetails', StopRecord.fromSnapshot),
        },
      ),
  'DetailsMap': (data) async => ParameterData(
        allParams: {
          'location': getParameter<LatLng>(data, 'location'),
          'address': getParameter<String>(data, 'address'),
        },
      ),
  'CreateProfile': ParameterData.none(),
  'DetailsMapRoute': (data) async => ParameterData(
        allParams: {
          'deliveryReference':
              getParameter<DocumentReference>(data, 'deliveryReference'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
