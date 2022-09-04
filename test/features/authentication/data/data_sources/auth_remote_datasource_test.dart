import 'dart:convert';

import 'package:e_furniture/core/helpers/http_request_helper.dart';
import 'package:e_furniture/features/authentication/data/data_sources/auth_remote_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import '../../../../fixtures/fixture_reader.dart';

class MockHttpRequestHelper extends Mock implements HttpRequestHelper {}

void main() {
  late AuthRemoteDataSourceImpl remoteDataSource;
  late MockHttpRequestHelper server;

  setUp(() {
    server = MockHttpRequestHelper();
    remoteDataSource = AuthRemoteDataSourceImpl(server: server);
  });
  var body = {'email': 'fatma@gmail.com', 'password': '12345678'};
  var headers = {'Accept': 'application/json'};
  var url = 'http://192.168.43.39:8082/users/login';

  group("Login user", () {
    test('should perform a post request with email and password', () async {
      when(() => server.postRequest(
                url: url,
                headers: headers,
                body: body,
              ))
          .thenAnswer(
              (_) async => http.Response(fixture('absen_masuk.json'), 200));
      await remoteDataSource.loginWithUsernamePassword(
          'fatma@gmail.com', "12345678");
      verify(() => server.postRequest(url: url, headers: headers, body: body));
    });
    test('Should return a token when success ', () async {
      when(() => server.postRequest(
                url: url,
                headers: headers,
                body: body,
              ))
          .thenAnswer(
              (_) async => http.Response(fixture('absen_masuk.json'), 200));
      final result = await remoteDataSource.loginWithUsernamePassword(
          'fatma@gmail.com', "12345678");
      // expect(result, token);
      expect(result,
          equals(jsonDecode(fixture('absen_masuk.json'))['data'][0]['token']));
    });
  });
}
