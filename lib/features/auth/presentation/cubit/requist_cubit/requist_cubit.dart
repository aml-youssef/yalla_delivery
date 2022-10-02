import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/errors/failure.dart';
import '../../../domain/entities/requist.dart';
import '../../../domain/usecases/create_driver_requist_usecase.dart';
part 'requist_state.dart';

class RequistCubit extends Cubit<RequistState> {
  RequistCubit({required this.createDriverRequistUsecase}) : super(RequistInitialState());
  final CreateDriverRequistUsecase createDriverRequistUsecase;

    Future<void> createDriverRequist({
    required String username,
    required String phone,
    required String address,
    required String motoType,
    required String age,
  }) async {
    emit(RequistLoadingState());
    Either<Failure, Requist> result = await createDriverRequistUsecase(
        paramter: CreateDriverRequistParamters(
      username: username,
      address: address,
      age: age,
      motoType: motoType,
      phone: phone,
    ));
    emit(result.fold((l) {
      debugPrint(l.toString());
      return RequistErrorState(errorMessege: l.messege);
    }, (r) {
      debugPrint(r.toString());
      // HelperFunctions.saveDriver(r.driver as DriverModel);
      return RequistLoadedState(requist: r);
    }));
  }
}
