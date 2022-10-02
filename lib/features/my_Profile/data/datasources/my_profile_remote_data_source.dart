import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:yalla_delivery/core/network/dio_helper.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/api_end_points.dart';
import '../../../../core/errors/error_messege_model.dart';
import '../models/driver_model.dart';

abstract class MyProfileBaseRemoteDataSource {
  Future<DriverModel> getDriverData({required String id});
  Future<DriverModel> updateDriverImg({required String id, required File img});
  Future<DriverModel> changePassword(
      {required String id,
      required String oldPassword,
      required String newPassword});
}

class MyProfileRemoteDataSource implements MyProfileBaseRemoteDataSource {
  final Dio dio;

  MyProfileRemoteDataSource({required this.dio});

  @override
  Future<DriverModel> getDriverData({required String id}) async {
    final bool isConnected = await _isConnected;
    if (isConnected) {
      Response response =
          await dio.get(ApiEndPoints.singleDriver(id));
      if (response.statusCode == 200) {
        debugPrint(response.data.toString());
        debugPrint('3o3o3o3oo3o3o3o3o3o3o3o3oo3o3o3o3o3o3o3');
        if (response.data == null) throw ArgumentError();
        return DriverModel.fromMap(response.data);
      } else {
        throw ServerExeption(errormsg: 'alllllllllllllllloo');
      }
    } else {
      throw IntenetConnectionException(errorMessege: 'you are not connected');
    }
  }

  @override
  Future<DriverModel> updateDriverImg(
      {required String id, required File img}) async {
    final bool isConnected = await _isConnected;
    if (isConnected) { 
    String fileName = img.path.split('/').last;
    FormData formData = FormData.fromMap({
        '_id': id,
        "files": await MultipartFile.fromFile(img.path, filename:fileName),
    });
    Response response = await dio.put(ApiEndPoints.driverImg, data: formData);
      if (response.statusCode == 200) {
        return DriverModel.fromMap(response.data['driver']);
      } else {
        throw ServerExeption(errormsg: 'alllllllllllllllloo');
      }
    } else {
      throw IntenetConnectionException(errorMessege: 'you are not connected');
    }
  }

  @override
  Future<DriverModel> changePassword(
      {required String id,
      required String oldPassword,
      required String newPassword}) async {
    final bool isConnected = await _isConnected;
    if (isConnected) {
      Response response =
          await dio.put(ApiEndPoints.changePassword, data: {
        '_id': id,
        'password': oldPassword,
        'newPassword': newPassword,
      });
      if (response.statusCode == 200) {
        return DriverModel.fromMap(response.data['driver']);
      } else {
        throw ServerExeption(errormsg: 'alllllllllllllllloo');
      }
    } else {
      throw IntenetConnectionException(errorMessege: 'you are not connected');
    }
  }

  Future<bool> get _isConnected async =>
      await InternetConnectionChecker().hasConnection;
}
