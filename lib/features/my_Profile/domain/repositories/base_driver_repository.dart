import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:yalla_delivery/core/errors/failure.dart';
import 'package:yalla_delivery/features/my_Profile/domain/entities/driver.dart';


abstract class BaseDriverRepository {
  Future<Either<Failure, Driver>> getDriverData({required String id});
  Future<Either<Failure, Driver>> updateDriverImg(
      {required String id, required File img});
  Future<Either<Failure, Driver>> changePassword( 
      {required String id,
      required String oldPassword,
      required String newPassword});
}
