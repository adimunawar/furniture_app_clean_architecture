import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:e_furniture/core/errors/exceptions.dart';
import 'package:e_furniture/features/authentication/data/data_sources/auth_local_data_source.dart';
import 'package:e_furniture/features/authentication/data/data_sources/auth_remote_data_source.dart';
import 'package:e_furniture/features/authentication/domain/repositories/auth_repository.dart';

import '../../../../core/errors/failures.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDatasource localDatasource;

  AuthRepositoryImpl(
      {required this.remoteDataSource, required this.localDatasource});

  @override
  Future<Either<Failure, String>> createUser(
      String username, String fullname, String email, String password) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> getAuthToken() {
    // TODO: implement getAuthToken
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> loginUserWithUsernamePassword(
      String username, String password) async {
    try {
      String token =
          await remoteDataSource.loginWithUsernamePassword(username, password);
      await localDatasource.setAuthToken(token);
      return Right(token);
    } on ServerException catch (e) {
      return Left(ServerFailure(code: 300, message: e.message));
    } on TimeoutException catch (e) {
      return Left(ServerFailure(code: 300, message: e.message));
    }
  }
}
