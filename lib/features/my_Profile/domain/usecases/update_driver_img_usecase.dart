import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:yalla_delivery/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:yalla_delivery/core/usecase/usecase.dart';
import 'package:yalla_delivery/features/auth/domain/entities/driver_login.dart';
import '../entities/driver.dart';
import '../repositories/base_driver_repository.dart';

class UpdateDriverImgUseCase
    implements BaseUsecase<Driver, UpdateDriverImgParamters> {
        final BaseDriverRepository baseDriverRepository;

  UpdateDriverImgUseCase({required this.baseDriverRepository});

  @override
  Future<Either<Failure, Driver>> call(
      {required UpdateDriverImgParamters paramter}) async {
    return await baseDriverRepository.updateDriverImg(id: paramter.id, img: paramter.img);
  }
}

class UpdateDriverImgParamters extends Equatable{
  final String id;
  final File img;

  const UpdateDriverImgParamters({required this.id, required this.img});
  
  @override
  List<Object?> get props => [id, img];
}
