import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:yalla_delivery/core/errors/failure.dart';
import 'package:yalla_delivery/core/usecase/usecase.dart';
import '../entities/reset_after_forget.dart';
import '../repositories/base_driver_login_repository.dart';

class ResetAfterForgetUseCase
    implements BaseUsecase<ResetAfterForget, ResetAfterForgetPasramters> {
  final BaseDriverAuthRepository baseDriverAuthRepository;

  ResetAfterForgetUseCase({required this.baseDriverAuthRepository});

  @override
  Future<Either<Failure, ResetAfterForget>> call(
      {required ResetAfterForgetPasramters paramter}) async {
    return await baseDriverAuthRepository.resetAfterForget(
      phone: paramter.phone,
      password: paramter.password,
      token: paramter.token,
    );
  }
}

class ResetAfterForgetPasramters extends Equatable {
  final String phone;
  final String password;
  final String token;

  const ResetAfterForgetPasramters({
    required this.phone,
    required this.password,
    required this.token,
  });

  @override
  List<Object?> get props => [
        phone,
        password,
        token,
      ];
}
