import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_delivery/features/auth/domain/entities/driver_login.dart';
import 'package:yalla_delivery/features/auth/domain/entities/requist.dart';
import 'package:yalla_delivery/features/auth/domain/usecases/create_driver_requist_usecase.dart';
import 'package:yalla_delivery/features/auth/domain/usecases/get_driver_login_data_usecase.dart';
import 'package:yalla_delivery/features/my_Profile/data/models/driver_model.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/functions/helper_functions.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final GetDriverLoginDataUsecase getDriverLoginDataUsecase;
  LoginCubit({required this.getDriverLoginDataUsecase})
      : super(LoginInitialState());

  Future<void> getDriverLoginData({
    required String userName,
    required String password,
  }) async {
    emit(LoginLoadingState());
    Either<Failure, DriverLogin> result = await getDriverLoginDataUsecase(
        paramter: GetDriverLoginDataParamters(
            userName: userName, password: password));
    emit(result.fold((l) {
      debugPrint(l.toString());
      return LoginErrorState(errorMessege: l.messege);
    }, (r) {
      debugPrint(r.toString());
      HelperFunctions.saveDriver(r.driver as DriverModel);
      return LoginLoadedState(driverLogin: r);
    }));
  }
}
//619ca4ef7194d731d0ade24d