import 'dart:convert';

import 'package:http/http.dart';

Response httpRequestErrorHelper({
  required String httpMethod,
  required dynamic error,
  required String url,
}) {
  Map<String, dynamic> body = {
    'status': false,
    // 'message': '$url, e: $error',
    // 'error_message': '$url, e: $error',
    'message': '$error',
    'error_message': '$error',
  };

  String bodyJson = jsonEncode(body);
  Uri address = Uri.parse(url);
  return Response(
    bodyJson,
    404,
    request: Request(httpMethod, address),
  );
}

StreamedResponse httpStreamResponseErrorHelper({
  required String httpMethod,
  required dynamic error,
  required String url,
}) {
  Map<String, dynamic> body = {
    'status': false,
    // 'message': '$url, e: $error',
    // 'error_message': '$url, e: $error',
    'message': '$error',
    'error_message': '$error',
  };

  String bodyJson = jsonEncode(body);
  Uri address = Uri.parse(url);

  return StreamedResponse(
    Stream.value(bodyJson.codeUnits),
    404,
    request: Request(httpMethod, address),
  );
}
