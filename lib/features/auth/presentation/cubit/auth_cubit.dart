import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yalla_delivery/features/auth/domain/entities/driver_login.dart';
import 'package:yalla_delivery/features/auth/domain/usecases/get_driver_login_data_usecase.dart';
import 'package:yalla_delivery/features/my_Profile/data/models/driver_model.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/functions/helper_functions.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final GetDriverLoginDataUsecase getDriverLoginDataUsecase;
  AuthCubit({required this.getDriverLoginDataUsecase})
      : super(AuthInitialState());

  Future<void> getDriverLoginData({
    required String userName,
    required String password,
  }) async {
    emit(AuthLoadingState());
    Either<Failure, DriverLogin> result = await getDriverLoginDataUsecase(
        paramter: GetDriverLoginDataParamters(
            userName: userName, password: password));
    emit(result.fold((l) {
      debugPrint(l.toString());
      return AuthErrorState(errorMessege: l.messege);
    }, (r) {
      debugPrint(r.toString());
      HelperFunctions.saveDriver(r.driver as DriverModel);
      return AuthLoadedState(driverLogin: r);
    }));
  }
}
//619ca4ef7194d731d0ade24d