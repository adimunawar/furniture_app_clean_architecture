import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:e_furniture/core/errors/exceptions.dart';
import 'package:e_furniture/core/network/network_info.dart';
import 'package:e_furniture/features/authentication/data/data_sources/auth_local_data_source.dart';
import 'package:e_furniture/features/authentication/data/data_sources/auth_remote_data_source.dart';
import 'package:e_furniture/features/authentication/domain/repositories/auth_repository.dart';
import '../../../../core/errors/failures.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDatasource localDatasource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDatasource,
      required this.networkInfo});

  @override
  Future<Either<Failure, String>> createUser(
      String username, String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        String token =
            await remoteDataSource.creatUser(username, email, password);
        await localDatasource.setAuthToken(token);
        return Right(token);
      } on ServerException catch (e) {
        return Left(ServerFailure(code: 300, message: e.message));
      } on TimeoutException catch (e) {
        return Left(ServerFailure(code: 300, message: e.message));
      }
    } else {
      return const Left(
          ServerFailure(code: 300, message: 'No interner connection'));
    }
  }

  @override
  Future<Either<Failure, String>> getAuthToken() async {
    try {
      String token = await localDatasource.getAuthToken();
      await localDatasource.setAuthToken(token);
      return Right(token);
    } catch (e) {
      return const Left(ErrorHandler(errorMessage: 'No Auth token Found'));
    }
  }

  @override
  Future<Either<Failure, String>> loginUserWithUsernamePassword(
      String username, String password) async {
    if (!await networkInfo.isConnected) {
      return const Left(
          ServerFailure(code: 500, message: 'no internet connection'));
    }
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
