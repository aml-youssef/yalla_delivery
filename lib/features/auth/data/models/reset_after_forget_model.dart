import '../../domain/entities/reset_after_forget.dart';

class ResetAfterForgetModel extends ResetAfterForget {
  ResetAfterForgetModel({
    required super.success,
    required super.msgs,
  });
  
  factory ResetAfterForgetModel.fromMap(Map<String, dynamic> json) => ResetAfterForgetModel(
        success: json["success"],
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
