import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:yalla_delivery/core/errors/failure.dart';
import 'package:yalla_delivery/core/usecase/usecase.dart';
import 'package:yalla_delivery/features/auth/domain/entities/forget_password.dart';

import '../repositories/base_driver_login_repository.dart';

class ForgetPasswordUsecase
    implements BaseUsecase<Forgetpw, ForgetPasswordParamters> {
  final BaseDriverAuthRepository baseDriverAuthRepository;

  ForgetPasswordUsecase({required this.baseDriverAuthRepository});

  @override
  Future<Either<Failure, Forgetpw>> call(
      {required ForgetPasswordParamters paramter}) async {
    return await baseDriverAuthRepository.forgetPassword(
      phone: paramter.phone,
      token: paramter.token,
    );  
  }
}

class ForgetPasswordParamters extends Equatable {
  final String phone;
  final String token;

  const ForgetPasswordParamters({required this.phone, required this.token});

  @override
  List<Object?> get props => [
        phone,
        token,
      ];
}
