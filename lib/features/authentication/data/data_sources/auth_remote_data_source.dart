import 'dart:convert';
import 'package:e_furniture/core/helpers/http_request_helper.dart';
import '../../../../core/errors/exceptions.dart';

abstract class AuthRemoteDataSource {
  Future<String> loginWithUsernamePassword(String username, String password);
  Future<String> creatUser(String username, String email, String password);
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  HttpRequestHelper server;

  AuthRemoteDataSourceImpl({required this.server});

  @override
  Future<String> loginWithUsernamePassword(
      String username, String password) async {
    String url = 'http://192.168.43.39:8082/users/login';
    Map<String, String> headers = {'Accept': 'application/json'};
    Map<String, String> body = {
      'email': username,
      'password': password,
    };
    final response =
        await server.postRequest(url: url, headers: headers, body: body);

    Map<String, dynamic> result = json.decode(response.body);
    if (result['status'] == null) {
      throw ServerException(
        message: 'Server Response Null, please contact Customer Service',
        code: response.statusCode,
      );
    }
    if (result['status']) {
      String token = result['data'][0]['token'];
      return token;
    } else {
      throw ServerException(
        message: result['message'] ?? 'login Error',
        code: response.statusCode,
      );
    }
  }

  @override
  Future<String> creatUser(
      String username, String email, String password) async {
    String url = 'http://192.168.43.39:8082/users/register';
    Map<String, String> headers = {'Accept': 'application/json'};
    Map<String, String> body = {
      'email': email,
      'name': username,
      'password': password,
    };
    final response =
        await server.postRequest(url: url, headers: headers, body: body);

    Map<String, dynamic> result = json.decode(response.body);

    if (result['status'] == null) {
      throw ServerException(
        message: 'Server Response Null, please contact Customer Service',
        code: response.statusCode,
      );
    }
    if (result['status']) {
      String token = result['data'][0]['token'];
      return token;
    } else {
      throw ServerException(
        message: result['message'] ?? 'Register Error',
        code: response.statusCode,
      );
    }
  }
}
