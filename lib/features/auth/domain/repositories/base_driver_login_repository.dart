import 'package:dartz/dartz.dart';
import 'package:yalla_delivery/core/errors/failure.dart';
import 'package:yalla_delivery/features/auth/domain/entities/driver_login.dart';

abstract class BaseDriverLoginRepository {
  Future<Either<Failure, DriverLogin>> getDriverLoginData({required String userName, required String password});
}
