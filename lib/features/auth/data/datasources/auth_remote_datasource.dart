import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:yalla_delivery/features/auth/domain/entities/driver_login.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/api_end_points.dart';
import '../models/driver_Login_model.dart';
import '../models/forget_password_model.dart';
import '../models/requist_model.dart';
import '../models/reset_after_forget_model.dart';

abstract class BaseAuthRemoteDataSource {
  Future<DriverLogin> getDriverLoginData(
      {required String userName, required String password});
  
  Future<RequistModel> createRequist(
      {required String username,
      required String phone,
      required String address,
      required String motoType,
      required String age});
  
  Future<ForgetpwModel> forgetPassword(
      {required String phone, required String token});
  
  Future<ResetAfterForgetModel> resetAfterForget({
    required String phone,
    required String password,
    required String token,
  });
}

class AuthRemoteDataSource implements BaseAuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSource({required this.dio});

  @override
  Future<DriverLoginModel> getDriverLoginData(
      {required String userName, required String password}) async {
    final bool isConnected = await _isConnected;
    if (isConnected) {
      // Response response =
      return dio
          .post(ApiEndPoints.driverLogin, data: {
            'username': userName,
            'password': password,
          })
          .then((response) => DriverLoginModel.fromMap(response.data))
          .catchError((response) {
            print('3o3o3o3oo3o3o3o3o3o3o3o3o3oo3');
            print(response);
            throw ServerExeption(errormsg: 'alooooooooo');
          });
      // if (response.statusCode == 200) {
      //   return DriverLoginModel.fromMap(response.data);
      // } else {
      //   throw ServerExeption(
      //       errorMessegeModel: ErrorMessegeModel.fromMap(response.data));
      // }
    } else {
      throw IntenetConnectionException(errorMessege: 'you are not connected');
    }
  }

  @override
  Future<RequistModel> createRequist({
    required String username,
    required String phone,
    required String address,
    required String motoType,
    required String age,
  }) async {
    final bool isConnected = await _isConnected;
    if (isConnected) {
      return await dio.post(ApiEndPoints.createRequist, data: {
        'username': username,
        'age': age,
        'address': address,
        'phone': phone,
        'motoType': motoType,
      }).then((value) {
        debugPrint(value.toString());
        return RequistModel.fromMap(value.data);
      }).catchError((response) {
        debugPrint(response.response.data["errors"]["msgs"]["ar"]);
        throw ServerExeption(
            errormsg: response.response.data["errors"]["msgs"]["ar"]);
      });
    } else {
      throw IntenetConnectionException(errorMessege: 'you are not connected');
    }
  }

  @override
  Future<ForgetpwModel> forgetPassword(
      {required String phone, required String token}) async {
    final bool isConnected = await _isConnected;
    if (isConnected) {
      return dio
          .post(ApiEndPoints.forgetpw, data: {
            'phone': phone,
            'token': token,
          })
          .then((response) => ForgetpwModel.fromMap(response.data))
          .catchError((response) {
            throw ServerExeption(errormsg: 'alooooooooo');
          });
    } else {
      throw IntenetConnectionException(errorMessege: 'you are not connected');
    }
  }

  @override
  Future<ResetAfterForgetModel> resetAfterForget({
    required String phone,
    required String password,
    required String token,
  }) async {
    final bool isConnected = await _isConnected;
    if (isConnected) {
      return dio
          .put(ApiEndPoints.resetAfterForget, data: {
            'phone': phone,
            'password': password,
            'secPassword': password,
            'token': token,
          })
          .then((response) => ResetAfterForgetModel.fromMap(response.data))
          .catchError((response) {
            throw ServerExeption(errormsg: 'alooooooooo');
          });
    } else {
      throw IntenetConnectionException(errorMessege: 'you are not connected');
    }
  }

  Future<bool> get _isConnected async =>
      await InternetConnectionChecker().hasConnection;
}
