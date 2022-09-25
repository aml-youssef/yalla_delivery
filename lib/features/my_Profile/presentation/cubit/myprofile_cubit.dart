import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_delivery/core/functions/helper_functions.dart';
import 'package:yalla_delivery/features/my_Profile/data/models/driver_model.dart';
import 'package:yalla_delivery/features/my_Profile/domain/usecases/change_password_usecase.dart';
import 'package:yalla_delivery/features/my_Profile/domain/usecases/get_driver_data_usecase.dart';
import 'package:yalla_delivery/features/my_Profile/domain/usecases/update_driver_img_usecase.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/driver.dart';
part 'myprofile_state.dart';

class MyprofileCubit extends Cubit<MyprofileState> {
  final GetDriverDataUsecase getDriverDataUsecase;
  final UpdateDriverImgUseCase updateDriverImgUseCase;
  final ChangePasswordUseCase changePasswordUseCase;

  MyprofileCubit(
      {required this.changePasswordUseCase,
      required this.updateDriverImgUseCase,
      required this.getDriverDataUsecase})
      : super(MyprofileInitialState());

  Future<void> getMyProfileData() async {
    Driver? driver = HelperFunctions.getDriver();
    // if (driver == null) {
    //   Either<Failure, Driver> result = await getDriverDataUsecase(
    //       paramter: GetDriverDataParamters(id: '6316fbdf241031002312eefc'));
    //   emit(result.fold((l) {
    //     debugPrint(l.toString());
    //     return MyprofileErrorState(errorMessege: l.messege);
    //   }, (r) {
    //     debugPrint(r.toString());
    //     return MyprofileLoadedState(driver: r);
    //   }));
    // } else {
    //   debugPrint(driver.toString());
    //   debugPrint('3o3o3o3o3o3o3o3oo3o3333333333333333333oooooooo3o3o3oo3');
    //   emit(MyprofileLoadedState(driver: driver));
    // }
    debugPrint(driver.toString());
    emit(MyprofileLoadedState(driver: driver!));
  }

  Future<void> updateMyProfileImg({required File img}) async {
    emit(MyprofileLoadingState());
    Driver driver = HelperFunctions.getDriver()!;
    Either<Failure, Driver> result = await updateDriverImgUseCase(
        paramter: UpdateDriverImgParamters(id: driver.id, img: img));
    emit(result.fold((l) {
      debugPrint(l.toString());
      return MyprofileErrorState(errorMessege: l.messege);
    }, (r) {
      debugPrint(r.toString());
      HelperFunctions.saveDriver(r as DriverModel);
      return MyprofileLoadedState(driver: r);
    }));
  }

  Future<void> changePassword(
      {required String oldPassword, required String newPassword}) async {
    emit(MyprofileLoadingState());
    Driver driver = HelperFunctions.getDriver()!;
    Either<Failure, Driver> result = await changePasswordUseCase(
        paramter: ChangePasswordParamters(
            id: driver.id, oldPAssword: oldPassword, newPassword: newPassword));
    emit(result.fold((l) {
      debugPrint(l.toString());
      return MyprofileErrorState(errorMessege: l.messege);
    }, (r) {
      debugPrint(r.toString());
      HelperFunctions.saveDriver(r as DriverModel);
      return MyprofileLoadedState(driver: r);
    }));
  }
}
