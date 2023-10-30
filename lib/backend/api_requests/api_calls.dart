import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start ReplicateAPI Group Code

class ReplicateAPIGroup {
  static String baseUrl = 'https://api.replicate.com/v1';
  static Map<String, String> headers = {};
  static GetPredictionCall getPredictionCall = GetPredictionCall();
  static CreatePredictionCall createPredictionCall = CreatePredictionCall();
}

class GetPredictionCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? tokReGet = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Prediction',
      apiUrl: '${ReplicateAPIGroup.baseUrl}/predictions/${id}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Token ${tokReGet}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  dynamic output(dynamic response) => getJsonField(
        response,
        r'''$.output[0]''',
      );
  dynamic error(dynamic response) => getJsonField(
        response,
        r'''$.error''',
      );
}

class CreatePredictionCall {
  Future<ApiCallResponse> call({
    String? imageURL = '',
    String? tokReCreate = '',
    String? imageURL2 = '',
  }) async {
    final ffApiRequestBody = '''
{
  "version": "8c1e100ecabb3151cf1e6c62879b6de7a4b84602de464ed249b6cff0b86211d8",
  "input": {
    "source": "data:image/jpeg;base64,${imageURL}",
    "target": "data:image/jpeg;base64,${imageURL2}",
    "keep_fps": false,
    "keep_frames": false,
    "enhance_face": true
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Prediction',
      apiUrl: '${ReplicateAPIGroup.baseUrl}/predictions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Token ${tokReCreate}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
}

/// End ReplicateAPI Group Code

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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
