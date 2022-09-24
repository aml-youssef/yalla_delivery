import 'package:equatable/equatable.dart';

import '../../../my_Profile/domain/entities/driver.dart';

class DriverLogin extends Equatable {
  DriverLogin({
    required this.driver,
    required this.authanticated,
    required this.token,
    required this.success,
    required this.msgs,
  });
   
  Driver driver;
  bool authanticated;
  String token;
  bool success;
  Msgs msgs;

  Map<String, dynamic> toMap() => {
        "driver": driver.toMap(),
        "authanticated": authanticated,
        "token": token,
        "success": success,
        "msgs": msgs.toMap(),
      };

  @override
  List<Object?> get props => [
        driver,
        authanticated,
        token,
        success,
        msgs,
      ];
}


class Msgs extends Equatable {
  Msgs({
    required this.ar,
    required this.eng,
    required this.kur,
  });

  String ar;
  String eng;
  String kur;

  Map<String, dynamic> toMap() => {
        "ar": ar,
        "eng": eng,
        "kur": kur,
      };


  @override
  List<Object?> get props => [ar, eng, kur];
}
