import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:yalla_delivery/core/errors/failure.dart';
import 'package:yalla_delivery/core/usecase/usecase.dart';
import 'package:yalla_delivery/features/auth/domain/entities/requist.dart';
import '../repositories/base_driver_login_repository.dart';

class CreateDriverRequistUsecase
    implements BaseUsecase<Requist, CreateDriverRequistParamters> {
  final BaseDriverAuthRepository baseDriverAuthRepository;

  CreateDriverRequistUsecase({required this.baseDriverAuthRepository});

  @override
  Future<Either<Failure, Requist>> call(
      {required CreateDriverRequistParamters paramter}) async {
    return await baseDriverAuthRepository.getDriverRequistData(
      username: paramter.username,
      phone: paramter.phone,
      address: paramter.address,
      motoType: paramter.motoType,
      age: paramter.age,
    );
  }
}

class CreateDriverRequistParamters extends Equatable {
  final String username;
  final String phone;
  final String address;
  final String motoType;
  final String age;

  const CreateDriverRequistParamters({
    required this.username,
    required this.phone,
    required this.address,
    required this.motoType,
    required this.age,
  });

  @override
  List<Object?> get props => [
        username,
        phone,
        address,
        motoType,
        age,
      ];
}
