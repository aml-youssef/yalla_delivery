import 'package:equatable/equatable.dart';
import 'package:yalla_delivery/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:yalla_delivery/core/usecase/usecase.dart';
import 'package:yalla_delivery/features/my_Profile/domain/entities/driver.dart';

import '../repositories/base_driver_repository.dart';

class ChangePasswordUseCase
    implements BaseUsecase<Driver, ChangePasswordParamters> {
  final BaseDriverRepository baseDriverRepository;

  ChangePasswordUseCase({required this.baseDriverRepository});

  @override
  Future<Either<Failure, Driver>> call(
      {required ChangePasswordParamters paramter}) async {
    return await baseDriverRepository.changePassword(
      id: paramter.id,
      oldPassword: paramter.oldPAssword,
      newPassword: paramter.newPassword,
    );
  }
}

class ChangePasswordParamters extends Equatable {
  final String id, oldPAssword, newPassword;

  const ChangePasswordParamters({
    required this.id,
    required this.oldPAssword,
    required this.newPassword,
  });

  @override
  List<Object?> get props => [id, oldPAssword, newPassword];
}
