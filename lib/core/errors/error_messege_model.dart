import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';


class ErrorMessegeModel extends Equatable{
    Errors errors;

    ErrorMessegeModel({
        required this.errors,
    });


    factory ErrorMessegeModel.fromMap(Map<String, dynamic> json) => ErrorMessegeModel(
        errors: Errors.fromMap(json["errors"]),
    );

    Map<String, dynamic> toMap() => {
        "errors": errors.toMap(),
    };
    
      @override
      List<Object?> get props => [errors];
}

class Errors extends Equatable{
    Errors({
        required this.msgs,
    });

    Msgs msgs;

    factory Errors.fromMap(Map<String, dynamic> json) => Errors(
        msgs: Msgs.fromMap(json["msgs"]),
    );

    Map<String, dynamic> toMap() => {
        "msgs": msgs.toMap(),
    };
    
      @override
      List<Object?> get props => [msgs];
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

    factory Msgs.fromMap(Map<String, dynamic> json) => Msgs(
        ar: json["ar"],
        eng: json["eng"],
        kur: json["kur"],
    );

    Map<String, dynamic> toMap() => {
        "ar": ar,
        "eng": eng,
        "kur": kur,
    };
    
      @override
      List<Object?> get props => [ar, eng, kur];
}










// class ErrorMessegeModel extends Equatable {
//   final int statusCode;
//   final String statusMessege;
//   final bool success;

//   const ErrorMessegeModel({
//     required this.statusCode,
//     required this.statusMessege,
//     required this.success,
//   });

//   factory ErrorMessegeModel.fromJson(Map<String, dynamic> json) =>
//       ErrorMessegeModel(
//         statusCode: json['status_code'],
//         statusMessege: json['status_message'],
//         success: json['success'],
//       );

//   @override
//   List<Object?> get props => [statusCode, statusMessege, success];
// }
