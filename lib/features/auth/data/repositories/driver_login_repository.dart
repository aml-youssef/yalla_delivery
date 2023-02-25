import 'package:dio/dio.dart';
import 'package:yalla_delivery/core/errors/exceptions.dart';
import 'package:yalla_delivery/features/auth/domain/entities/driver_login.dart';
import 'package:yalla_delivery/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:yalla_delivery/features/auth/domain/entities/forget_password.dart';
import 'package:yalla_delivery/features/auth/domain/entities/requist.dart';
import 'package:yalla_delivery/features/auth/domain/entities/reset_after_forget.dart';
import '../../domain/repositories/base_driver_login_repository.dart';
import '../datasources/auth_remote_datasource.dart';

class DriverAuthRepository implements BaseDriverAuthRepository {
  final BaseAuthRemoteDataSource baseRemoteDataSource;

  DriverAuthRepository({required this.baseRemoteDataSource});
  @override
  Future<Either<Failure, DriverLogin>> getDriverLoginData({
    required String userName,
    required String password,
  }) async {
    try {
      final response = await baseRemoteDataSource.getDriverLoginData(
        userName: userName,
        password: password,
      );
      return Right(response);
    } on ServerExeption catch (error) {
      return Left(ServerFailure(messege: error.errormsg));
    } on IntenetConnectionException catch (error) {
      return Left(IntenetConnectionFailure(messege: error.errorMessege));
    }
  }

  @override
  Future<Either<Failure, Requist>> getDriverRequistData({
    required String username,
    required String phone,
    required String address,
    required String motoType,
    required String age,
  }) async {
    try {
      final response = await baseRemoteDataSource.createRequist(
        username: username,
        phone: phone,
        address: address,
        motoType: motoType,
        age: age,
      );
      return Right(response);
    } on ServerExeption catch (error) {
      return Left(ServerFailure(messege: error.errormsg));
    } on IntenetConnectionException catch (error) {
      return Left(IntenetConnectionFailure(messege: error.errorMessege));
    }
  }

  @override
  Future<Either<Failure, Forgetpw>> forgetPassword({
    required String phone,
    required String token,
  }) async {
    try {
      final response =
          await baseRemoteDataSource.forgetPassword(phone: phone, token: token);
      return Right(response);
    } on ServerExeption catch (error) {
      return Left(ServerFailure(messege: error.errormsg));
    } on IntenetConnectionException catch (error) {
      return Left(IntenetConnectionFailure(messege: error.errorMessege));
    }
  }

  @override
  Future<Either<Failure, ResetAfterForget>> resetAfterForget({
    required String phone,
    required String password,
    required String token,
  }) async {
    try{
      final response = await baseRemoteDataSource.resetAfterForget(phone: phone, password: password, token: token,);
      return Right(response);
    }on ServerExeption catch (error) {
      return Left(ServerFailure(messege: error.errormsg));
    } on IntenetConnectionException catch (error) {
      return Left(IntenetConnectionFailure(messege: error.errorMessege));
    }
  }
}
