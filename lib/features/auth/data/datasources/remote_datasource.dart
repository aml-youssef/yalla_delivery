import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:yalla_delivery/core/network/dio_helper.dart';
import 'package:yalla_delivery/features/auth/domain/entities/driver_login.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/api_end_points.dart';
import '../../../../core/errors/error_messege_model.dart';
import '../models/driver_Login_model.dart';

abstract class BaseRemoteDataSource {
  Future<DriverLogin> getDriverLoginData(
      {required String userName, required String password});
}

class RemoteDataSource implements BaseRemoteDataSource {
  // final DioHelper dioHelper;

  // RemoteDataSource({required this.dioHelper});

  final Dio dio;

  RemoteDataSource({required this.dio});

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
            throw ServerExeption(
                errorMessegeModel: ErrorMessegeModel.fromMap(response.data));
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

  Future<bool> get _isConnected async =>
      await InternetConnectionChecker().hasConnection;
}
