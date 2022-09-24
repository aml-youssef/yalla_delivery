import 'dart:io';
import 'package:yalla_delivery/core/errors/exceptions.dart';
import 'package:yalla_delivery/features/auth/domain/entities/driver_login.dart';
import 'package:yalla_delivery/features/my_Profile/domain/entities/driver.dart';
import 'package:yalla_delivery/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repositories/base_driver_repository.dart';
import '../datasources/my_profile_remote_data_source.dart';

class DriverRepository implements BaseDriverRepository {
  final MyProfileBaseRemoteDataSource myProfileBaseRemoteDataSource;

  DriverRepository({required this.myProfileBaseRemoteDataSource});

  @override
  Future<Either<Failure, Driver>> getDriverData({required String id}) async {
    try {
      final response =
          await myProfileBaseRemoteDataSource.getDriverData(id: id);
      return right(response);
    } on ServerExeption catch (error) {
      return Left(ServerFailure(messege: error.errorMessegeModel.toString()));
    } on IntenetConnectionException catch (error) {
      return Left(IntenetConnectionFailure(messege: error.errorMessege));
    }
  }

  @override
  Future<Either<Failure, Driver>> updateDriverImg(
      {required String id, required File img}) async {
    try {
      final response =
          await myProfileBaseRemoteDataSource.updateDriverImg(id: id, img: img);
      return right(response);
    } on ServerExeption catch (error) {
      return Left(ServerFailure(messege: error.errorMessegeModel.toString()));
    } on IntenetConnectionException catch (error) {
      return Left(IntenetConnectionFailure(messege: error.errorMessege));
    }
  }

  @override
  Future<Either<Failure, Driver>> changePassword(
      {required String id,
      required String oldPassword,
      required String newPassword}) async {
    try {
      final response = await myProfileBaseRemoteDataSource.changePassword(
        id: id,
        oldPassword: oldPassword,
        newPassword: newPassword,
      );
      return right(response);
    } on ServerExeption catch (error) {
      return Left(ServerFailure(messege: error.errorMessegeModel.toString()));
    } on IntenetConnectionException catch (error) {
      return Left(IntenetConnectionFailure(messege: error.errorMessege));
    }
  }
}
