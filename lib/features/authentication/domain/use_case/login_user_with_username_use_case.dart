import 'package:dartz/dartz.dart';
import 'package:e_furniture/core/errors/failures.dart';
import 'package:e_furniture/core/usecase/usecase.dart';
import 'package:e_furniture/features/authentication/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

class LoginWithUsernamePassword implements Usecase<String, Params> {
  final AuthRepository authRepository;

  LoginWithUsernamePassword(this.authRepository);

  @override
  Future<Either<Failure, String>> call(Params params) {
    return authRepository.loginUserWithUsernamePassword(
        params.username!, params.password!);
  }
}

class Params extends Equatable {
  final String? username;
  final String? password;

  const Params(
    this.username,
    this.password,
  );

  @override
  List<Object> get props => [username!, password!];
}
