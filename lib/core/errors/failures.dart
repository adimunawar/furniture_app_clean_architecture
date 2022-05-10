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
