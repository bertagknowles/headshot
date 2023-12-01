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
        r'''$.output''',
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
    String? prompt = '',
  }) async {
    final ffApiRequestBody = '''
{
  "version": "8a8a433d097748349b236e3c555b186b1d475de1d85a6a4915aa3140581dd8da",
  "input": {
    "face_image": "data:image/jpeg;base64,${imageURL}",
    "pose_image": "data:image/jpeg;base64,${imageURL2}",
    "prompt": "${prompt}",
    "n_prompt": "nude, nsfw, naked, explicit, porn, text, cropped, out of frame, worst quality, low quality, jpeg artifacts, ugly, duplicate, morbid, mutilated, extra fingers, mutated hands, poorly drawn hands, poorly drawn face, mutation, deformed, blurry, dehydrated, bad anatomy, bad proportions, extra limbs, cloned face, disfigured, gross proportions, malformed limbs, missing arms, missing legs, extra arms, extra legs, fused fingers, too many fingers, long neck",
    "width": 512
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
