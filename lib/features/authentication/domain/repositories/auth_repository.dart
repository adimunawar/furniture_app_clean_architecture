import 'package:dartz/dartz.dart';
import 'package:e_furniture/core/errors/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> loginUserWithUsernamePassword(
      String username, String password);
  Future<Either<Failure, String>> getAuthToken();
  Future<Either<Failure, String>> createUser(
    String username,
    String email,
    String password,
  );
}
