import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetOptimicedRouteGoogleCall {
  static Future<ApiCallResponse> call() async {
    final ffApiRequestBody = '''
{
  "origin": {
    "location": {
      "latLng": {
        "latitude": -34.9049311,
        "longitude": -56.2065608
      }
    }
  },
  "intermediates": [
    {
      "location": {
        "latLng": {
          "latitude": -34.9058009,
          "longitude": -56.1821932
        }
      }
    },
    {
      "location": {
        "latLng": {
          "latitude": -34.9041328,
          "longitude": -56.1327192
        }
      }
    },
    {
      "location": {
        "latLng": {
          "latitude": -34.8889873,
          "longitude": -56.1864482
        }
      }
    },
    {
      "location": {
        "latLng": {
          "latitude": -34.908642,
          "longitude": -56.2080807
        }
      }
    }
  ],
  "travelMode": "DRIVE",
  "optimizeWaypointOrder": true
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getOptimicedRouteGoogle',
      apiUrl: 'https://routes.googleapis.com/directions/v2:computeRoutes',
      callType: ApiCallType.POST,
      headers: {
        'X-Goog-Api-Key': 'AIzaSyD3WpNC9Xafbe4VxMznrpqGmbq9cJCp1t4',
        'X-Goog-FieldMask':
            'routes.duration,routes.distanceMeters,routes.legs,routes.optimizedIntermediateWaypointIndex',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static double? distance(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.routes[0].distance''',
      ));
  static double? duration(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.routes[0].duration''',
      ));
  static List? route(dynamic response) => getJsonField(
        response,
        r'''$.waypoints''',
        true,
      ) as List?;
}

class GetOptimicedRouteCall {
  static Future<ApiCallResponse> call({
    String? coordinates =
        '-56.20656080000001,-34.9049311;-56.1821932,-34.9058009;-56.1327192,-34.9041328;-56.1864482,-34.8889873;-56.2080807,-34.908642',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getOptimicedRoute',
      apiUrl:
          'https://api.mapbox.com/optimized-trips/v1/mapbox/driving/${coordinates}?roundtrip=false&source=first&destination=last&access_token=sk.eyJ1IjoiZHVhbm55amNyIiwiYSI6ImNtZW91c28zNTFqcjAyd3BscjE1MjJhdzMifQ.-ZMLFUYpWHiDD0DKIZUkfw',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic distance(dynamic response) => getJsonField(
        response,
        r'''$.routes[0].distance''',
      );
  static dynamic duration(dynamic response) => getJsonField(
        response,
        r'''$.routes[0].duration''',
      );
  static List? route(dynamic response) => getJsonField(
        response,
        r'''$.waypoints''',
        true,
      ) as List?;
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
