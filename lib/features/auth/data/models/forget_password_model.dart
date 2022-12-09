import 'package:yalla_delivery/features/auth/domain/entities/forget_password.dart';

class ForgetpwModel extends Forgetpw {
  ForgetpwModel({
    required super.success,
    required super.token,
    required super.msgs,
  });
  factory ForgetpwModel.fromMap(Map<String, dynamic> json) => ForgetpwModel(
        success: json["success"],
        token: json["token"],
        msgs: MsgsModel.fromMap(json["msgs"]),
      );
}

class MsgsModel extends Msgs {
  MsgsModel({
    required super.ar,
    required super.eng,
    required super.kur,
  });

  factory MsgsModel.fromMap(Map<String, dynamic> json) => MsgsModel(
        ar: json["ar"],
        eng: json["eng"],
        kur: json["kur"],
      );
}
