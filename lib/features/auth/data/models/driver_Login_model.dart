import 'package:yalla_delivery/features/auth/domain/entities/driver_login.dart';

import '../../../my_Profile/data/models/driver_model.dart';

class DriverLoginModel extends DriverLogin {
  DriverLoginModel({
    required super.driver,
    required super.authanticated,
    required super.token,
    required super.success,
    required super.msgs,
  });

  factory DriverLoginModel.fromMap(Map<String, dynamic> json) =>
      DriverLoginModel(
        driver: DriverModel.fromMap(json["driver"]),
        authanticated: json["authanticated"],
        token: json["token"],
        success: json["success"],
        msgs: MsgsModel.fromMap(json["msgs"]),
      );
}


class MsgsModel extends Msgs{
  MsgsModel({required super.ar, required super.eng, required super.kur});

    factory MsgsModel.fromMap(Map<String, dynamic> json) => MsgsModel(
        ar: json["ar"],
        eng: json["eng"],
        kur: json["kur"],
      );
}
