import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDatasource {
  ///returns a token
  Future<String> getAuthToken();

  ///Persists the user auth token
  Future<void> setAuthToken(String authToken);

  Future<bool> isFirstTime();

  Future<void> setIsFirstTime();
}

class AuthLocalDatasourceImpl extends AuthLocalDatasource {
  final SharedPreferences? sharedPreferences;

  //Constructor
  AuthLocalDatasourceImpl({@required this.sharedPreferences});

  @override
  Future<String> getAuthToken() {
    //Extract the token from local storage
    final token = sharedPreferences?.getString('token') ?? '';

    //returning future value
    return Future.value(token);
  }

  @override
  Future<void> setAuthToken(String authToken) {
    //cache the token
    return sharedPreferences!.setString('token', authToken);
  }

  @override
  Future<bool> isFirstTime() {
    //Extract the token from local storage
    final bool isFirstTime = sharedPreferences!.getBool('isFirstTime') ?? true;

    // final bool isFirstTime = true;

    //returning future e
    return Future.value(isFirstTime);
  }

  @override
  Future<void> setIsFirstTime() {
    //Change value to false
    return sharedPreferences!.setBool('isFirstTime', false);
  }
}
