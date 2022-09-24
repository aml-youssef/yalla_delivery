import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:yalla_delivery/core/errors/failure.dart';
import 'package:yalla_delivery/core/usecase/usecase.dart';
import 'package:yalla_delivery/features/my_Profile/domain/entities/driver.dart';
import 'package:yalla_delivery/features/my_Profile/domain/repositories/base_driver_repository.dart';

class GetDriverDataUsecase
    implements BaseUsecase<Driver, GetDriverDataParamters> {
  final BaseDriverRepository baseDriverRepository;

  GetDriverDataUsecase({required this.baseDriverRepository});

  @override
  Future<Either<Failure, Driver>> call({
    required GetDriverDataParamters paramter,
  }) async {
    return await baseDriverRepository.getDriverData(id: paramter.id);
  }
}

class GetDriverDataParamters extends Equatable {
  final String id;

  const GetDriverDataParamters({required this.id});

  @override
  List<Object?> get props => [id];
}
