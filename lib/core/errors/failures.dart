import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({
    this.message,
    this.code,
  });

  final String? message;
  final int? code;

  @override
  List<Object> get props => [message!, code!];
}

class ServerFailure extends Failure {
  const ServerFailure({
    String? message,
    int? code,
  }) : super(message: message, code: code);
}

class CacheFailure extends Failure {
  const CacheFailure({
    String? message,
    int? code,
  }) : super(message: message, code: code);
}

class UnknownFailure extends Failure {
  const UnknownFailure({
    String? message,
    int? code,
  }) : super(message: message, code: code);
}

class ErrorHandler extends Failure {
  //Properties
  final String? errorMessage;
  final String? name;
  final String? email;
  final String? password;
  final String? token;

  const ErrorHandler({
    this.errorMessage,
    this.name,
    this.email,
    this.password,
    this.token,
  });

//Serialize data
  factory ErrorHandler.fromJson(Map<String, dynamic> errors) {
    return ErrorHandler(
      errorMessage: errors['errorMessage'],
      name: errors['errors']['name'],
      email: errors['errors']['email'],
      password: errors['errors']['password'],
      token: errors['errors']['token'],
    );
  }

  //To Create a custom error from app
  ErrorHandler setError({
    errorMessage = '',
    name = '',
    email = '',
    password = '',
    token = '',
  }) {
    return ErrorHandler(
      errorMessage: errorMessage,
      name: name,
      email: email,
      password: password,
      token: token,
    );
  }
}
