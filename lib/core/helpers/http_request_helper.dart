import 'dart:io';
import 'package:e_furniture/core/helpers/http_request_error_helper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class HttpRequestHelper {
  Future<http.Response> getRequest({
    required String url,
    required Map<String, String> headers,
  });

  /// Calls the DELETE request to an API.
  Future<http.Response> deleteRequest({
    required String url,
    required Map<String, String> headers,
  });

  /// Calls the POST request to an API.
  Future<http.Response> postRequest({
    required String url,
    required Map<String, String> headers,
    dynamic body,
  });

  /// Calls the Multipart POST request to an API.
  Future<http.Response> multipartPostRequest({
    required String url,
    required File image,
    required String fileBodyKey,
    required Map<String, String> headers,
    required Map<String, String> body,
  });

  /// Calls the Multipart POST request to an API.
  Future<http.Response> multipartPostRequestWithoutImage({
    required String url,
    required Map<String, String> headers,
    required Map<String, String> body,
  });

  /// Calls the Multipart DELETE request to an API.
  Future<http.Response> multipartDeleteRequest({
    required String url,
    required Map<String, String> headers,
    required Map<String, String> body,
  });
}

class HttpRequestHelperImpl extends HttpRequestHelper {
  @override
  Future<http.Response> deleteRequest(
      {required String url, required Map<String, String> headers}) {
    // TODO: implement deleteRequest
    throw UnimplementedError();
  }

  @override
  Future<http.Response> getRequest(
      {required String url, required Map<String, String> headers}) {
    // TODO: implement getRequest
    throw UnimplementedError();
  }

  @override
  Future<http.Response> multipartDeleteRequest(
      {required String url,
      required Map<String, String> headers,
      required Map<String, String> body}) {
    // TODO: implement multipartDeleteRequest
    throw UnimplementedError();
  }

  @override
  Future<http.Response> multipartPostRequest(
      {required String url,
      required File image,
      required String fileBodyKey,
      required Map<String, String> headers,
      required Map<String, String> body}) {
    // TODO: implement multipartPostRequest
    throw UnimplementedError();
  }

  @override
  Future<http.Response> multipartPostRequestWithoutImage(
      {required String url,
      required Map<String, String> headers,
      required Map<String, String> body}) {
    // TODO: implement multipartPostRequestWithoutImage
    throw UnimplementedError();
  }

  @override
  Future<http.Response> postRequest(
      {required String url, required Map<String, String> headers, body}) async {
    Uri address = Uri.parse(url);
    if (body == null) {
      return await http
          .post(address, headers: headers)
          .timeout(const Duration(seconds: 30), onTimeout: () {
        return httpRequestErrorHelper(
            httpMethod: 'POST', error: 'Koneksi ke server habis', url: url);
      }).catchError((e) {
        return httpRequestErrorHelper(
            httpMethod: 'POST', error: 'Sistem sedang sibuk', url: url);
      });
    } else {
      return await http
          .post(address, headers: headers, body: body)
          .timeout(const Duration(seconds: 30), onTimeout: () {
        return httpRequestErrorHelper(
            httpMethod: 'POST', error: 'Koneksi ke server habis', url: url);
      }).catchError((e) {
        return httpRequestErrorHelper(
            httpMethod: 'POST', error: 'Sistem sedang sibuk', url: url);
      });
    }
  }
}
