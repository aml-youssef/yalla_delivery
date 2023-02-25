import 'package:dartz/dartz.dart';
import 'package:yalla_delivery/core/errors/failure.dart';
import 'package:yalla_delivery/features/auth/domain/entities/driver_login.dart';
import 'package:yalla_delivery/features/auth/domain/entities/forget_password.dart';
import 'package:yalla_delivery/features/auth/domain/entities/requist.dart';
import '../entities/reset_after_forget.dart';

abstract class BaseDriverAuthRepository {
  Future<Either<Failure, DriverLogin>> getDriverLoginData(
      {required String userName, required String password});

  Future<Either<Failure, Requist>> getDriverRequistData({
    required String username,
    required String phone,
    required String address,
    required String motoType,
    required String age,
  });

  Future<Either<Failure, Forgetpw>> forgetPassword({
    required String phone,
    required String token,
  });

  Future<Either<Failure, ResetAfterForget>> resetAfterForget({
    required String phone,
    required String password,
    required String token,
  });


}
