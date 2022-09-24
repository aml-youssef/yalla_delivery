import 'package:equatable/equatable.dart';
import 'package:yalla_delivery/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:yalla_delivery/features/auth/domain/entities/driver_login.dart';
import 'package:yalla_delivery/features/auth/domain/repositories/base_driver_login_repository.dart';
import '../../../../core/usecase/usecase.dart';

class GetDriverLoginDataUsecase
    implements BaseUsecase<DriverLogin, GetDriverLoginDataParamters> {
  final BaseDriverLoginRepository baseDriverLoginRepository;

  GetDriverLoginDataUsecase({required this.baseDriverLoginRepository});

  @override
  Future<Either<Failure, DriverLogin>> call(
      {required GetDriverLoginDataParamters paramter}) async {
    return await baseDriverLoginRepository.getDriverLoginData(
      userName: paramter.userName,
      password: paramter.password,
    );
  }
}

class GetDriverLoginDataParamters extends Equatable {
  final String userName;
  final String password;

  const GetDriverLoginDataParamters({required this.userName, required this.password});

  @override
  List<Object?> get props => [userName, password];
}
