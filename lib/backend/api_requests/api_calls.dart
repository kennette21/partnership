import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class RoboHashCall {
  static Future<ApiCallResponse> call({
    String? value = 'name',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'RoboHash',
      apiUrl: 'https://robohash.org/${value}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}
